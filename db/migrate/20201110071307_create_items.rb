class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user               , null: false, foreign_key: true
      t.string     :name               , null: false
      t.text       :description        , null: false
      t.integer    :category_id        , null: false
      t.integer    :condition_id       , null: false
      t.integer    :postage_pay_id     , null: false
      t.integer    :prefectures_id     , null: false
      t.integer    :posting_date_id    , null: false
      t.integer    :price              , null: false
      t.timestamps
    end
  end
end
