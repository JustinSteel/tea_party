class CreateJoinTableForSubscriptionsAndTeas < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions_teas, id: false do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :tea, null: false, foreign_key: true
    end unless table_exists?(:subscriptions_teas)
  end
end
