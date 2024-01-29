class RemoveSubscriptionsTeas < ActiveRecord::Migration[7.1]
  def change
    drop_table :subscriptions_teas
    add_reference :teas, :subscription, foreign_key: true
  end
end
