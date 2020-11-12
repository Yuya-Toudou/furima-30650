class CreateDeliveryDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_destinations do |t|
      t.references :buy,            null: false,  foreign_key: true
      t.string     :zip_code,       null: false
      t.integer    :prefectures_id, null: false
      t.string     :municipality,   null: false
      t.string     :address,        null: false
      t.string     :house_name
      t.string     :phone_number,   null: false
      t.timestamps
    end
  end
end
