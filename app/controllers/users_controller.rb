class UsersController < ApplicationController
  get '/signup' do
    erb :"users/new_html"
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      # render vs redirect
      # render will keep user info in the next request (render when the current request has data that we need)
      # as http is stateless, no data can persists from one request to another
      # redirect will loose info about user in the next request as that information is only available in the current request
      #redirect '/signup'
      erb :"users/new_html"
    end
  end
end
