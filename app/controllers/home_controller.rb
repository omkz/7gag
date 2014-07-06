class HomeController < ApplicationController
  # before_filter :get_dummy
  
  def index
    # commontator_thread_show(@dummy_model)
  end
  
  
  
  def show
    commontator_thread_show(@dummy_model)
  end
  
  def get_dummy
    @dummy_model = Post.find(params[:id])
  end
end
