class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :which_delivery_payment_id, null: false
      t.integer :prefecture_id, null:false
      t.integer :time_for_delivery_id, null: false
      t.integer :price, null: false
      t.references :user ,null:false,foreign_key: true
      t.timestamps
    end
  end
end
