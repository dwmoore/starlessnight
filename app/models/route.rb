class Route < ActiveRecord::Base

  validates :starting_system, presence: true
  validates :starting_dock, presence: true
  validates :ending_system, presence: true
  validates :ending_dock, presence: true
  validates :commodity, presence: true
  validates :buy_price, presence: true
  validates :sell_price, presence: true
  validates :distance, presence: true
  validates :make_private, presence: true

  validates :buy_price, numericality: true
  validates :sell_price, numericality: true
  validates :distance, numericality: true

  validates :distance, format: { with: /\A(\d{0,3})[\.]?(\d{0,2})\z/, message: 'Distance should follow ###.## format' }

  belongs_to :user
end
