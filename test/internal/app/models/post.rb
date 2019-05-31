class Post < ActiveRecord::Base
  include MetaInformationable

  meta_information :source_data
end
