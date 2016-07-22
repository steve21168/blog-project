class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def snippet
    self.content[0..80]
  end
end
