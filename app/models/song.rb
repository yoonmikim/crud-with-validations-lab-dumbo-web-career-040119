class Song < ApplicationRecord
  validates :title, presence: true 
  validates :title, uniqueness: true 
  validates :released, inclusion: {in: [true, false] } 
  validates :release_year, presence: true 
  validates_numericality_of :release_year { less_than_or_equal_to: 2019 }
  validates :artist_name, presence: true 
end
