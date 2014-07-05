class AddMemeColumnsToPosts < ActiveRecord::Migration
  def self.up
    add_attachment :posts, :meme
  end

  def self.down
    remove_attachment :posts, :meme
  end
end
