class RevalidationBuildingNameColumnNullToTrueShippingAddresses < ActiveRecord::Migration[7.0]
  def up
    # Not Null制約を外す場合　not nullを外したいカラム横にtrueを記載
    change_column_null :shipping_addresses, :building_name, true
  end

end
