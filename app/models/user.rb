class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w.+-]+@([\w][\w]*[\w]*\.)+[a-zA-Z]{2,}/.freeze

  validates :first_name, presence: true, length: { maximum: 10 }
  validates :last_name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX, message: '有効なメールアドレスを入力してうほ'}
  validates :password, presence: true, length: { minimum: 8, allow_blank: true}, on: create

  validates :affilication, length: { maximum:15 }
  validates :university, length: { maximum:15 }
  validates :favorite_terrain, length: { maximum:15 }
  validates :something_to_say, length: { maximum:80 }
  validates :achievement, length: { maximum:100 }
  
  enum favorite_event: { sprint: 0, middle: 1, long: 2, relay: 3 }
  
  has_many :articles
  has_many :comments, dependent: :destroy
  has_many :stamps
  has_many :bookmarks, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :follower, through: :active_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed

  def author_or_not?(article)
    article.user_id == id
  end

  def commenter_or_not?(comment)
    comment.user_id == id
  end

  def current_user_or_not?(user)
    user.id == id
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
