class WelcomeController < ApplicationController

  def index
    # blah
  end

  def retrieve_from_api
    # do stuff here
    render 'index'
  end
end