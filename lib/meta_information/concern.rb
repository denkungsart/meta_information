module MetaInformation
  module Concern
    extend ActiveSupport::Concern

    class_methods do
      def meta_information(name)
        assoc_name = :"#{name}_content"

        has_one assoc_name, -> { where(type: name.to_s.camelcase) }, class_name: "MetaInformation::Content", as: :owner, inverse_of: :owner, autosave: true, dependent: :delete

        define_method(name) do
          send(assoc_name).try(:data)
        end

        define_method("#{name}=") do |data|
          if data.present?
            model = send(assoc_name) || send("build_#{assoc_name}")
            model.data = data
          else
            send(assoc_name).try(:mark_for_destruction)
          end
          data
        end
      end
    end
  end
end
