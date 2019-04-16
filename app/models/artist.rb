class Artist < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :favorites
  has_many :users, through: :favorites
end
