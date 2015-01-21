class Route < ActiveRecord::Base

  validates :starting_system, presence: true
  validates :starting_dock, presence: true
  validates :ending_system, presence: true
  validates :ending_dock, presence: true
  validates :commodity, presence: true
  validates :buy_price, presence: true
  validates :sell_price, presence: true
  validates :jump_distance, presence: true
  validates :dock_distance, presence: true
  validates :cargo_capacity, presence: true

  validates :buy_price, numericality: true
  validates :sell_price, numericality: true
  validates :jump_distance, numericality: true
  validates :dock_distance, numericality: true
  validates :cargo_capacity, numericality: true

  validates :jump_distance, format: { with: /\A(\d{0,3})[\.]?(\d{0,2})\z/, message: 'Distance should follow ###.## format' }

  belongs_to :user
end
