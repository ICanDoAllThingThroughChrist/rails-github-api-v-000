class RepositoriesController < ApplicationController
  before_action :authenticate_user

  def index
    user = Faraday.get "http://api.github.com/user" do |req|
      req.headers["Authorization"] = "token " + session[:token]
      req.headers["Accept"] = 'application/json'
    end
    binding.pry
    @user_data = JSON.parse(user.body)
    binding.pry
    repos = Faraday.get "https://api.github.com/user/repos" do |req|
      req.headers["Authorization"] = "token " + session[:token]
      req.headers["Accept"] = 'application/json'
    end
    @repos_data = JSON.parse(repos.body)
  end
end
