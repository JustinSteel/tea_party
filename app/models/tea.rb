class Tea < ApplicationRecord
  validates_presence_of :title, :description, :temperature, :brew_time

  belongs_to :subscription
end