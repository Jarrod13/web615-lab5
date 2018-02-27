class Article < ApplicationRecord

  validates :content, presence: true
  validates :title, presence: true
  belongs_to :user
  has_many :comments
end
