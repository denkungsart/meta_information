require "meta_information/concern"

module MetaInformation
  class Engine < ::Rails::Engine
    initializer "meta_information.include_concern" do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.include(MetaInformation::Concern)
      end
    end
  end
end
