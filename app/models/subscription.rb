class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency

  enum status: [:active, :cancelled]

  belongs_to :customer
  has_many :subscriptions_teas
  has_many :teas, through: :subscriptions_teas, source: :tea
end