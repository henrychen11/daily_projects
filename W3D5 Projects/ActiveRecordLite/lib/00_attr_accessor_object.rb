require 'active_support/inflector'


class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end

#
# AttrAccessorObject.my_attr_accessor("treats")
# fido = AttrAccessorObject.new
# fido.treats =
