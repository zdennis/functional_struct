class FunctionalStruct
  def initialize(options={})
    metaclass = class << self ; self ; end
    options.each_pair do |method_name, val|
      if val.is_a?(Proc)
        metaclass.send :define_method, method_name do |*args|
          val.call(*args)
        end
      else
        metaclass.send :define_method, method_name do
          val 
        end
      end
    end
  end
end
