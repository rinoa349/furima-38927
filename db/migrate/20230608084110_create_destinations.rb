class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string     :post_code,     null: false
      t.string     :city,          null: false
      t.string     :adress,        null: false
      t.string     :building_name, null: false
      t.string     :phone_number,  null: false
      t.references :order,         null: false, foreign_key: true
      t.string     :prefecture_id, null: false
      t.timestamps
    end
  end
end
