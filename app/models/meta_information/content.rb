module MetaInformation
  class Content < ActiveRecord::Base
    self.inheritance_column = nil
    self.table_name = "meta_informations"

    serialize(:data, JSON) unless columns_hash["data"].type.in?([:json, :jsonb])

    belongs_to :owner, polymorphic: true, inverse_of: :meta_informations
  end
end
