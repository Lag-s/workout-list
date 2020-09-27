class Workout < ApplicationRecord
  belongs_to :user
  
  validates :date, presence: true
  validates :event, presence: true, length: { maximum: 255 }
  validates :totaldistance, presence: true
  validates :totaltime, presence: true
  validates :content, length: { maximum: 255 }
end