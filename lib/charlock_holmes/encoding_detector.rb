require 'icu4j-51_1.jar'

java_import 'com.ibm.icu.text.CharsetDetector'
java_import 'java.io.ByteArrayInputStream'

module CharlockHolmes
  module EncodingDetector
    module_function

    def detect(string)
      dect = CharsetDetector.new
      dect.setText ByteArrayInputStream.new(string.to_java_bytes)
      if charset_match = dect.detect()
        charset_match.to_hash
      else
        nil
      end
    end

    def detect_all(string)
      dect = CharsetDetector.new
      dect.setText ByteArrayInputStream.new(string.to_java_bytes)
      if charset_matchs = dect.detect_all()
        charset_matchs.collect {|match| match.to_hash }
      else
        nil
      end
    end

  end
end