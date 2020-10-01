class Workout < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :event, presence: true, length: { maximum: 255 }
  validates :totaldistance, presence: true, numericality: { greater_than: 0 }
  validates :totaltime, presence: true, numericality: { greater_than: 0 }
  validates :content, length: { maximum: 255 }

  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user

  def start_time
    self.date
  end
end