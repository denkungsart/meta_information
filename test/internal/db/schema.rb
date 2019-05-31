# frozen_string_literal: true

ActiveRecord::Schema.define do
  create_table(:posts, force: true) do |t|
    t.string :name
    t.text   :content
    t.timestamps
  end
end
