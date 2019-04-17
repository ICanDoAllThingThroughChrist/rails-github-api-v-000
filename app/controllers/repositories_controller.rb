class RepositoriesController < ApplicationController
  before_action :authenticate_user

  def index
    response = Faraday.get("http://github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", "Accept" => "application/json"})
      @repos_array = JSON.parse(response.body)
      repos = Faraday.get("http://api.github.com/user/repos") do |req|
        req.headers['Authorization'] = "token" + session[:token]
        req.headers['Accept'] = "application/json"
      end
      body = JSON.parse(user.body)
      @user_name = body["login"]
      @repos_list = JSON.parse(repos.body)
 end
end
