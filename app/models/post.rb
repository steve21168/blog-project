class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :thumbnail, through: :user

  validates :title, :content, presence: true

  def snippet
    self.content[0..80]
  end
end
