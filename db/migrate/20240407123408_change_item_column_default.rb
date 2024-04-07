class ChangeItemColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :items, :description, nil
  end
end
