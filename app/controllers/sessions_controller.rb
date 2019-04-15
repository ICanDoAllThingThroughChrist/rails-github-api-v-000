class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
      req.body = {'client_id': '4066e8edf2ed0d247543',
    'client_secret': '1f3e121e87949294c152f3db4ae41859b4bc584c',
    'code': '20'}
    #binding.pry
    req.headers['Accept'] = 'application/json'
  end
    body = JSON.parse(resp.body)
    session[:token] = body['access_token']
    redirect_to root_path
  end
end
