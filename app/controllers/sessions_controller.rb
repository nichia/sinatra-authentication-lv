class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login_html"
  end

  post '/sessions' do
    #raise params.inspect
    #raise params[:email].inspect
    #session[:email] = params[:email]
    #raise session[:email].inspect
    # login a user with this email
    login(params[:email], params[:password])
    redirect :'/posts'
  end

  get '/logout' do
    logout!
    redirect :'/posts'
  end
end
