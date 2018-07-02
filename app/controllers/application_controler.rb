class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "auth_demo_lv"
  end

  #get '/' do
    #session[:greeting] = "Hello World"
    #response.set_cookie 'credit_amount', '100'
    #{}"Hello World!"
  #end

  #get '/remember' do
    #session[:greeting]
    #{}"you have #{request.cookies['credit_amount']} left to spend."
  #end


  helpers do

    def logged_in?
      #!!session[email]
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(:email => session[:email]) if session[:email]
    end

    def login(email, password)
      # Check if a user with this email actually exists
      # if so, set the session
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
          session[:email] = user.email
      else
        redirect :'/login'
      end
    end

    def logout!
      session.clear
      # Emailing them to let them know they logged out
    end
  end

end
