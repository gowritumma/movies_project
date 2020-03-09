class Score < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates_numericality_of :score, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, :notice => "Score ranges from 1 to 100."
end
