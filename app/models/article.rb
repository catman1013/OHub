class Article < ApplicationRecord
   #enumは配列として用意するので，シンボルでも文字列でも可能。
  validates :title, presence: true
  validates :content, presence: true
  #validates :category, presenece: true
  enum category: [ :心, :技, :体]

  belongs_to :user
end
#exampleorien@ex.com