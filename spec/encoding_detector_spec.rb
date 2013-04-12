# encoding: utf-8

require 'spec_helpers'
require 'charlock_holmes'

describe CharlockHolmes::EncodingDetector do
  subject { CharlockHolmes::EncodingDetector }

  describe "#detect" do
    it "should detect encoding of string" do
      detected = subject.detect 'hello'
      detected[:encoding].should == 'ISO-8859-1'
    end

    it "should accept encoding hint" do
      detected = subject.detect 'hello', 'UTF-8'
      detected[:encoding].should == 'ISO-8859-1'
    end
  end
  
  describe "#detect_all" do
    it "should returns array of possible matches" do
      detected_list = subject.detect_all 'test'
      detected_list.should be_a(Array)

      encoding_list = detected_list.map {|d| d[:encoding] }.sort
      encoding_list.should == ['ISO-8859-1', 'ISO-8859-2', 'UTF-8']
    end

    it "should accept encoding hint" do
      detected_list = subject.detect_all 'test', 'UTF-8'
      detected_list.should be_a(Array)

      encoding_list = detected_list.map {|d| d[:encoding] }.sort
      encoding_list.should == ['ISO-8859-1', 'ISO-8859-2', 'UTF-8']
    end
  end

  describe "#all_detectable_charsets" do
    it "should return array of charsets" do
      list = subject.all_detectable_charsets
      list.should be_a(Array)
      list.should == %w{
        UTF-8
        UTF-16BE
        UTF-16LE
        UTF-32BE
        UTF-32LE
        Shift_JIS
        ISO-2022-JP
        ISO-2022-CN
        ISO-2022-KR
        GB18030
        EUC-JP
        EUC-KR
        Big5
        ISO-8859-1
        ISO-8859-2
        ISO-8859-5
        ISO-8859-6
        ISO-8859-7
        ISO-8859-8
        windows-1251
        windows-1256
        KOI8-R
        ISO-8859-9
        IBM424_rtl
        IBM424_ltr
        IBM420_rtl
        IBM420_ltr
      }
    end
  end
end