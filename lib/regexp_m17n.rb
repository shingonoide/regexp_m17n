module RegexpM17N
  def self.non_empty?(str)
    str =~ /^.+$/
  end
end

String.class_eval do
  alias_method :real_encode, :encode
  def encode(enc)
    real_encode
  rescue Encoding::UndefinedConversionError
    self
  end
end
