class Album < ApplicationRecord
  belongs_to :user
  has_many :pic
end
