require 'spec_helper'
require 'load_card_formats'
require 'credit_card_format'
require 'validator'

describe Validator do
  describe "VISA Card Processing" do
    it "Handles Correct Visa Card Numbers" do
      cardtotest = Validator.new( "4408041234567893") 
      cardtotest.cardtype.should eql "VISA"
      cardtotest.valid.should eql "valid"
    end
  
    it "Handles Incorrect Visa Card Numbers" do
      cardtotest = Validator.new( "4417123456789112") 
      cardtotest.cardtype.should eql "VISA"
      cardtotest.valid.should eql "invalid"
    end
  
    it "Handles Visa Card Numbers with spaces" do
      cardtotest = Validator.new( "4408 0412 3456 7893") 
      cardtotest.cardtype.should eql "VISA"
      cardtotest.valid.should eql "valid"
      cardtotest.ccnumber.should eql "4408041234567893"
    end
  end

  describe "AMEX Card Processing" do
    it "Handles Correct AMEX Card Numbers" do
      cardtotest = Validator.new( "378282246310005") 
      cardtotest.cardtype.should eql "AMEX"
      cardtotest.valid.should eql "valid"
    end
  
    it "Handles Incorrect AMEX Card Numbers" do
      cardtotest = Validator.new( "378282246310006") 
      cardtotest.cardtype.should eql "AMEX"
      cardtotest.valid.should eql "invalid"
    end
  
    it "Handles Correct AMEX Card Numbers with spaces" do
      cardtotest = Validator.new( "3782 822463 10005") 
      cardtotest.cardtype.should eql "AMEX"
      cardtotest.valid.should eql "valid"
      cardtotest.ccnumber.should eql "378282246310005"
    end
  end

  describe "Discover Card Processing" do
    it "Handles Correct Discover Card Numbers" do
      cardtotest = Validator.new( "6011111111111117") 
      cardtotest.cardtype.should eql "Discover"
      cardtotest.valid.should eql "valid"
    end
  
    it "Handles Incorrect Discover Card Numbers" do
      cardtotest = Validator.new( "6011111111111118") 
      cardtotest.cardtype.should eql "Discover"
      cardtotest.valid.should eql "invalid"
    end
  
    it "Handles Correct Discover Card Numbers with spaces" do
      cardtotest = Validator.new( "6011 1111 1111 1117") 
      cardtotest.cardtype.should eql "Discover"
      cardtotest.valid.should eql "valid"
      cardtotest.ccnumber.should eql "6011111111111117"
    end
  end
  
  describe "MasterCard Card Processing" do
    it "Handles Correct MasterCard Card Numbers" do
      cardtotest = Validator.new( "5105105105105100") 
      cardtotest.cardtype.should eql "MasterCard"
      cardtotest.valid.should eql "valid"
    end
  
    it "Handles Incorrect MasterCard Card Numbers" do
      cardtotest = Validator.new( "5105105105105106") 
      cardtotest.cardtype.should eql "MasterCard"
      cardtotest.valid.should eql "invalid"
    end
  
    it "Handles Correct MasterCard Card Numbers with spaces" do
      cardtotest = Validator.new( "5105 1051 0510 5100") 
      cardtotest.cardtype.should eql "MasterCard"
      cardtotest.valid.should eql "valid"
      cardtotest.ccnumber.should eql "5105105105105100"
    end
  end

  describe "Unknown Card Processing" do
    it "Handles Unknown Card Numbers" do
      cardtotest = Validator.new( "9111111111111111") 
      cardtotest.cardtype.should eql "Unknown"
      cardtotest.valid.should eql "invalid"
    end
  
    it "Handles Unknown Card Numbers with spaces" do
      cardtotest = Validator.new( "9111 1111 1111 1111") 
      cardtotest.cardtype.should eql "Unknown"
      cardtotest.valid.should eql "invalid"
      cardtotest.ccnumber.should eql "9111111111111111"
    end
  end


end
