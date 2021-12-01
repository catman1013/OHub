class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  enum category: [ :mind, :technic, :physical]
  enum tech_category: [ :contaring, :go_straight, :take_a_direction]
  
  belongs_to :user
end