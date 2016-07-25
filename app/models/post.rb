class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :content, presence: true 

  def snippet
    self.content[0..80]
  end
end
