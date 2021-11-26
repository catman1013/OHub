class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true, length: { maximum: 10 }
  validates :last_name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true

  enum favorite_event: [ :スプリント,:ミドル ,:ロング, :リレー ]
  has_many :articles
end
