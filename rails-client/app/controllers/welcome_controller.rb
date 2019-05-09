class WelcomeController < ApplicationController

  def index
    @info = 'Nothing'
  end

  def retrieve_from_api
    url = 'http://dumpster-api:4001/info'

    r = Typhoeus.get(url)

    @info = r.body

    render 'index'
  end
end