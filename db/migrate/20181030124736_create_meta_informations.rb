class CreateMetaInformations < ActiveRecord::Migration[4.2]
  def change
    create_table :meta_informations do |t|
      t.references :owner, polymorphic: true, index: true, null: false
      t.string :type, null: false
      if connection.native_database_types.include?(:jsonb)
        t.jsonb :data, null: false, default: {}
      elsif connection.native_database_types.include?(:json)
        t.json :data, null: false, default: {}
      else
        t.text :data, null: false, default: "{}"
      end

      t.timestamps null: false
    end
  end
end
