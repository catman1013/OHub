class Article < ApplicationRecord
  include CommonModule
  
  validates :title, presence: true
  validates :content, presence: true

  enum category: { mind: 0, technic: 1, physical: 2 }
  enum tech_category: { contaring: 0, go_straight: 1, take_a_direction: 2 }
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :stamps, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def stamped_by?(user, stamp_type)
    stamps.where(user_id: user, type: stamp_type).exists?
  end

  def the_number_of_each_type_of_stamp
    count = { 面白い: self.stamps.where(type: "面白い").count,
      目から鱗: self.stamps.where(type: "目から鱗").count,
      ゴリラ: self.stamps.where(type: "ゴリラ").count,
    }
  end
end