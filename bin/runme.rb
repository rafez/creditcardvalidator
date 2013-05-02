# (c) Rafez Noorullah - 2013-05-02
# v1.0 - Original Version
# Run this file to get the format as expected
# ruby bin/runme.rb

require_relative '../lib/load_card_formats'
require_relative '../lib/credit_card_format'
require_relative '../lib/validator'

file = File.new("cardnumbers.txt", "r")
while (line = file.gets)
    puts Validator.new( line )
end
file.close