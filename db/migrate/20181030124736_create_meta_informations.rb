class CreateMetaInformations < ActiveRecord::Migration[4.2]
  def change
    create_table :meta_informations do |t|
      t.references :owner, polymorphic: true, index: true
      t.text :data, null: false, default: "{}"
      t.string :type

      t.timestamps null: false
    end
  end
end
