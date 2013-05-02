# (c) Rafez Noorullah - 2013-05-02
# v1.0 - Original Version
require_relative 'credit_card_format'

# Main Validation Class
class Validator
  attr_accessor :ccnumber, :cardtype, :valid

  UnknownStr = "Unknown"
  ValidStr = "valid"
  InvalidStr = "invalid"

  def initialize ccnumber
    @ccnumber = ccnumber.to_s.gsub(/\s+/, "")
    @cardvalidated ? "" : CheckCardAll()
  end


  def strTotal inStr
    return inStr.chars.inject(0) {|sum,n| sum+n.to_i }.to_s
  end

  def LuhnCheck 
    # There are three operations we need to do on the card
    # 1 - double every other digit from the next to last backwards
    # 2 Sum all double digit numbers
    # 3 Sum the total of all digits

    # Once we have a total figure if mod 10 then card is valid
    step1 = ccnumber.reverse.chars.each_with_index.map {|c,i| (i.modulo(2).zero?? c :
        (
        #  c.to_i
        step2 = (c.to_i*2).to_s
        step2.length > 1 ? strTotal( step2 ): step2
      #inject {|sum,n| sum+n.to_i}
      )
      )}

    step3 = step1.reduce(0){|sum,n| sum+n.to_i}

    return step3.modulo( 10 ).zero?
  end

  def CheckCardFormat
    # We need to ensure that we have matched both on the starting string and the length
    cchecks = CreditCardFormat.new.ccards
    cchecks.each_with_index { |cc, i|
    ( @ccnumber.match(/^#{cc.begins_with}/) && @ccnumber.length == cc.length ) ?  cardtype=cc.type : cardtype=UnknownStr
      return cardtype if ( cardtype != UnknownStr)
    }
    return UnknownStr
  end

  def CheckCardAll
    # Check the Card Format and the Luhn in a single call
    @cardtype = CheckCardFormat()
    @valid = ( @cardtype != UnknownStr ? ( LuhnCheck() ? ValidStr : InvalidStr) : InvalidStr )
    @cardvalidated = true  
  end

  def to_s
    # Provide a convenience method to get all out as single line
    @cardvalidated ? "" : CheckCardAll()
    #"#{@cardtype}: #{@ccnumber}\t(#{@valid})"
    "%-30s (%s)" % [@cardtype + ": " +@ccnumber, @valid]
  end


end