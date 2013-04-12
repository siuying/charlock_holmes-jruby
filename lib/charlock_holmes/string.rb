require_relative 'encoding_detector'

module CharlockHolmes
  module StringExt
    def detect_encoding(hint=nil)
      EncodingDetector.detect(self, hint)
    end

    def detect_encodings(hint=nil)
      EncodingDetector.detect_all(self, hint)
    end

    def detect_encoding!(hint=nil)
      detected = EncodingDetector.detect(self, hint)
      self.force_encoding(detected[:encoding]) if detected[:encoding]
      self
    end
  end
end

String.send :include, CharlockHolmes::StringExt