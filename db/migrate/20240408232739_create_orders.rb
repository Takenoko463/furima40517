class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null:false
      t.references :item, null:false
      t.timestamps
    end
  end
end
