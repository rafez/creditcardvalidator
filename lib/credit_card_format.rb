# (c) Rafez Noorullah - 2013-05-02
# v1.0 - Original Version

# Holds the Credit card formats we accept as being valid
class CreditCardFormat
  
  attr_accessor :type, :begins_with, :length, :ccards
  
  def initialize(params = {} )
    @type, @begins_with, @length = params[:type],params[:begins_with].to_s,params[:length].to_i
    @@ccards ||=[]
    # We do not add an empty credot card, as the class can be called to get the list of credit card checks 
    @@ccards.push self if !(params.empty?)
  end
  
  def ccards
    @@ccards
  end

end