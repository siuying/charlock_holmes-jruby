module CharlockHolmes
  module Converter
    extend self

    def convert(string, from, to, options={})
      raise TypeError.new("string cannot be nil") unless string
      raise TypeError.new("from cannot be nil") unless from
      raise TypeError.new("to cannot be nil") unless to
      string.encode(to, from, options)
    end
  end
end