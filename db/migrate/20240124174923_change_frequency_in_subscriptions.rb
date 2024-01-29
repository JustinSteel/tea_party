class ChangeFrequencyInSubscriptions < ActiveRecord::Migration[7.1]
  def change
    change_column :subscriptions, :frequency, 'integer USING CAST(frequency AS integer)'
  end
end
