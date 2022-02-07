class Article < ApplicationRecord
  include CommonModule
  
  validates :title, presence: true
  validates :content, presence: true
  validate :tech_category_can_be_saved_to_database_only_with_technic

  enum category: { mind: 0, technic: 1, physical: 2, strategy: 3, theory: 4 }
  enum tech_category: { contaring: 0, go_straight: 1, take_a_direction: 2 }
  enum status: { draft: 0, published: 1}

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :stamps, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def tech_category_can_be_saved_to_database_only_with_technic
    if category != 'technic' && tech_category.present?
      errors.add(:tech_category, 'は無効です。') 
    end
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def stamped_by?(user, stamp_type)
    stamps.where(user_id: user, type: stamp_type).exists?
  end

  def the_number_of_each_type_of_stamp
    count = { 面白い: self.stamps.where(type: '面白い').count,
      目から鱗: self.stamps.where(type: '目から鱗').count,
      ゴリラ: self.stamps.where(type: 'ゴリラ').count,
    }
  end

  def article_color
    if self.category == 'mind'
      ['border-red','back-red']
    elsif self.category == 'technic'
      ['border-green','back-green']
    elsif self.category == 'physical'
      ['border-blue','back-blue']
    else
      ['border-gray','back-gray']
    end
  end
  
end