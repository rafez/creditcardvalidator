# (c) Rafez Noorullah - 2013-05-02
# v1.0 - Original Version
# Convenience method to load all the credit card formats in one go - could have done as YML
require_relative "credit_card_format"

CreditCardFormat.new( :type=>"AMEX", :begins_with=>"34" , :length=>15 )
CreditCardFormat.new( :type=>"AMEX", :begins_with=>"37" , :length=>15 )
CreditCardFormat.new( :type=>"Discover", :begins_with=>"6011" , :length=>16 )
CreditCardFormat.new( :type=>"MasterCard", :begins_with=>"51" , :length=>16 )
CreditCardFormat.new( :type=>"MasterCard", :begins_with=>"52" , :length=>16 )
CreditCardFormat.new( :type=>"MasterCard", :begins_with=>"53" , :length=>16 )
CreditCardFormat.new( :type=>"MasterCard", :begins_with=>"54" , :length=>16 )
CreditCardFormat.new( :type=>"MasterCard", :begins_with=>"55" , :length=>16 )
CreditCardFormat.new( :type=>"VISA", :begins_with=> "4" ,  :length=>13 )
CreditCardFormat.new( :type=>"VISA", :begins_with=> "4" , :length=>16 )
