class PrototypedObject

  def set_property(property_name, value)
      self.class.send(:attr_accessor, property_name)
      self.send("#{property_name}=",value)
  end

  def set_method(selector, block)
    self.define_singleton_method(selector, block)
  end

end