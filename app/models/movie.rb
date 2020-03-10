class Movie < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :genres
  has_many :scores, dependent: :destroy
  validates :name, presence: true
end
