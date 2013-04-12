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

  describe "#detect_encodings" do
    it "should detect encoding of string" do
      detected_list = "test".detect_encodings
      encoding_list = detected_list.map {|d| d[:encoding] }.sort
      encoding_list.should == ['ISO-8859-1', 'ISO-8859-2', 'UTF-8']
    end

    it "should accept encoding hint" do
      detected_list = 'test'.detect_encodings 'UTF-8'
      encoding_list = detected_list.map {|d| d[:encoding] }.sort
      encoding_list.should == ['ISO-8859-1', 'ISO-8859-2', 'UTF-8']
    end
  end

  describe "#detect_encoding" do
    it "should change encoding of string" do
      str = "hello".detect_encoding!
      str.encoding.to_s.should == 'ISO-8859-1'
    end
  end
end