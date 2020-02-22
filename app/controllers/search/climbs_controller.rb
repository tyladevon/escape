class Search::ClimbsController < ApplicationController
  def new
    @destination = session[:destination]
  end
end
