java_import 'com.ibm.icu.text.CharsetMatch'

class com::ibm::icu::text::CharsetMatch
  def to_hash
    {
      encoding: self.getName(),
      confidence: self.getConfidence(),
      language: self.getLanguage()
    }
  end
end

