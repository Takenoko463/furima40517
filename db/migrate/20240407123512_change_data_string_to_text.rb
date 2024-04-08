class ChangeDataStringToText < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :description, :text
  end
end
