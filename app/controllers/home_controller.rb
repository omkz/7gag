class HomeController < ApplicationController
  # before_filter :get_dummy
  
  def index
    @posts = Post.all.order("created_at desc")
  end

end
