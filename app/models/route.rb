class Route < ActiveRecord::Base

  validates :starting_system, presence: true
  validates :ending_system, presence: true
  validates :commodity, presence: true
  validates :buy_price, presence: true
  validates :buy_price, numericality: true
  validates :sell_price, presence: true
  validates :sell_price, numericality: true
  validates :distance, presence: true
  validates :distance, numericality: true
  validates :distance, length: { maximum: 5 }
  validates :make_private, presence: true

  belongs_to :user
end
