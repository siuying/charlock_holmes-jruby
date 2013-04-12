require_relative 'version'
require_relative "../#{CharlockHolmes::ICU_JAR_FILENAME}"
java_import 'com.ibm.icu.text.CharsetMatch'

module CharlockHolmes
  module CharsetMatchExt
    def to_hash
      {
        encoding: self.getName(),
        confidence: self.getConfidence(),
        language: self.getLanguage()
      }
    end
  end
end

com::ibm::icu::text::CharsetMatch.send :include, CharlockHolmes::CharsetMatchExt
