class WelcomeController < ApplicationController

  def index
    @info = 'Nothing'
  end

  def retrieve_from_api
    magic_number = params[:magic_number]
    url = "http://dumpster-api:4001/info/#{magic_number}"

    r = Typhoeus.get(url)

    @info = r.body

    render 'index'
  end
end