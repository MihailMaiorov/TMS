class MyHash < Hash
  def method_missing(method, *args)
    return assignation(method, *args) if method.end_with?('=')

    return self[method] if self.key?(method)

    super
  end

  def assignation(method, *args)
    key = method.to_s.delete_suffix('=')
    self[key.to_sym] = args.first
  end
end
