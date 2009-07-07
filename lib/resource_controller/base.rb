begin
  require_dependency 'application_controller'
rescue LoadError => e
  require_dependency 'application'
end

module ResourceController
  def self.Base(superklass = ::ApplicationController)
    klass = Class.new(superklass)

    def klass.inherited(subclass)
      super
      subclass.class_eval { resource_controller }
    end

    klass
  end

  # == ResourceController::Base
  # 
  # Inherit from this class to create your RESTful controller.  See the README for usage.
  # 
  class Base < ::ApplicationController
    unloadable
    
    def self.inherited(subclass)
      super
      subclass.class_eval { resource_controller }
    end
  end
end
