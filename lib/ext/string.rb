class String
  def underscore
    self.gsub! /::/, '/'
    self.gsub! /([A-Z\d]+)([A-Z][a-z])/, '\1_\2'
    self.gsub! /([a-z\d])([A-Z])/, '\1_\2'
    self.tr!('-', '_')
    self.downcase!
  end
end
