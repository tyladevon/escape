class Search::ClimbController < ApplicationController
  def new
    @destination = session[:destination]
  end
end
