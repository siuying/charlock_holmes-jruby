# encoding: utf-8

require 'spec_helpers'
require 'charlock_holmes/string'

describe CharlockHolmes::StringExt do
  describe "#detect_encoding" do
    it "should detect encoding of string" do
      detected = "hello".detect_encoding
      detected[:encoding].should == 'ISO-8859-1'
    end

    it "should accept encoding hint" do
      detected = 'hello'.detect_encoding 'UTF-8'
      detected[:encoding].should == 'ISO-8859-1'
    end
  end
end