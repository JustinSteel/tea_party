class Tea < ApplicationRecord
  validates_presence_of :title, :description, :temperature, :brew_time

  has_many :subscriptions_teas
  has_many :subscriptions, through: :subscriptions_teas, source: :subscription
end