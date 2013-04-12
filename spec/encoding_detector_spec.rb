# encoding: utf-8

require 'spec_helpers'
require 'charlock_holmes'

describe CharlockHolmes::EncodingDetector do
  describe "#detect" do
    it "should detect encoding of string" do
      detected = CharlockHolmes::EncodingDetector.detect 'hello'
      detected[:encoding].should == 'ISO-8859-1'
    end
  end
  
  describe "#detect_all" do
    it "should returns array of possible matches" do
      detected_list = CharlockHolmes::EncodingDetector.detect_all 'hello'
      detected_list.should be_a(Array)

      encoding_list = detected_list.map {|d| d[:encoding] }.sort
      encoding_list.should == ['ISO-8859-1', 'ISO-8859-2', 'UTF-8']
    end
  end
end