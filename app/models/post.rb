class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :meme
  validates_attachment_content_type :meme, :content_type => /\Aimage\/.*\Z/
<<<<<<< HEAD
  acts_as_commentable
  acts_as_voteable
=======

>>>>>>> master
end
