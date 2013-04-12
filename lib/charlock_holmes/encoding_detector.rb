require_relative 'version'
require_relative "../#{CharlockHolmes::ICU_JAR_FILENAME}"
require_relative 'charset_match_ext'

java_import 'com.ibm.icu.text.CharsetDetector'
java_import 'java.io.ByteArrayInputStream'

module CharlockHolmes
  module EncodingDetector
    extend self

    def detect(string, hint=nil)
      detector = create_detector(string, hint)

      begin
        if charset_match = detector.detect()
          charset_match.to_hash
        else
          nil
        end
      rescue
        nil
      end
    end

    def detect_all(string, hint=nil)
      detector = create_detector(string, hint)

      begin
        if charset_matchs = detector.detectAll()
          charset_matchs.collect {|match| match.to_hash }
        else
          nil
        end
      rescue
        nil
      end
    end

    def all_detectable_charsets
      CharsetDetector.getAllDetectableCharsets().to_a
    end

    private
    def create_detector(string, hint=nil)
      detector = CharsetDetector.new
      detector.setText ByteArrayInputStream.new(string.to_java_bytes)
      detector.setDeclaredEncoding(hint)
      detector
    end
  end


end