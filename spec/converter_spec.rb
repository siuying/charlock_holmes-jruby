# encoding: utf-8

require 'spec_helpers'
require 'charlock_holmes'

describe CharlockHolmes::Converter do
  subject { CharlockHolmes::Converter }

  describe "#convert" do 
    it "should convert ascii from iso8859-1 to utf-16 and back" do
      input = 'test'

      output = subject.convert input, 'ISO-8859-1', 'UTF-16'
      output.encoding.to_s.should == "UTF-16"
      input.bytesize.should < output.bytesize
      input.should_not == output

      output = subject.convert output, 'UTF-16', 'ISO-8859-1'
      output.encoding.to_s.should == "ISO-8859-1"
      input.bytesize.should == output.bytesize
      input.should == output
    end

    it "should convert utf8 to utf16 and back" do
      input = 'λ, λ, λ'

      output = subject.convert input, 'UTF-8', 'UTF-16'
      output.encoding.to_s.should == "UTF-16"
      input.bytesize.should < output.bytesize
      input.should_not == output

      output = subject.convert output, 'UTF-16', 'UTF-8'
      output.encoding.to_s.should == "UTF-8"
      input.bytesize.should == output.bytesize
      input.should == output
    end

    it "should raise error if params are not string" do
      expect {
        subject.convert nil, 'UTF-8', 'UTF-16'
      }.to raise_error(TypeError)

      expect {
        subject.convert 'lol', 'UTF-8', nil
      }.to raise_error(TypeError)

      expect {
        subject.convert 'lol', nil, 'UTF-16'
      }.to raise_error(TypeError)

      expect {
        subject.convert 'lol', 'UTF-8', 'UTF-8'
      }.to_not raise_error(TypeError)
    end
  end

end