class Post < ApplicationRecord
  belongs_to :user

  def snippet
    self.content[0..80]  
  end
end
