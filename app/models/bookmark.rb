class Bookmark < ApplicationRecord
  validates :user_id, presence: true, uniqueness: { scope: :article_id }
end
