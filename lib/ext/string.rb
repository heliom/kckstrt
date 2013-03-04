class String
  def underscore
    self.gsub!(/::/, '/')
    self.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
    self.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    self.tr!("-", "_")
    self.downcase!
    self
  end

  def camelize(uppercase_first_letter = true)
    string = self.to_s.dup
    string.sub!(/^[a-z\d]*/) { $&.capitalize } if uppercase_first_letter
    string.gsub!('/', '::')
    string.gsub!(/(?:_|(\/|))([a-z\d]*)/i) { $2.capitalize }
  end
end
