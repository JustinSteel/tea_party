class RemoveCustomerIdFromSubscriptions < ActiveRecord::Migration[7.1]
  def change
    remove_column :subscriptions, :customer_id, :integer
  end
end
