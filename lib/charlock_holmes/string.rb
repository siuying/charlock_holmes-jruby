require_relative 'encoding_detector'

module CharlockHolmes
  module StringExt
    def detect_encoding(hint=nil)
      EncodingDetector.detect(self, hint)
    end
  end
end

String.send :include, CharlockHolmes::StringExt