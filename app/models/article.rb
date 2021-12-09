class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  enum category: [ :mind, :technic, :physical]
  enum tech_category: [ :contaring, :go_straight, :take_a_direction]
  enum status: [:draft, :published]
  
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

  def count_the_number_of_each_type_of_stamps
    stamp_count = []
    (0..2).each do |n|
      stamp_count << stamps.where("type = #{n}").count
    end
    stamp_count
  end

  def search_by_article_status(status_value)
    self.where(status: status_value)
  end
end