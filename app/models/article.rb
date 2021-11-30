class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  enum category: [ :心, :技, :体]
  enum tech_category: [ :コンタリング, :直進, :正置]
  
  belongs_to :user
end