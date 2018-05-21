class PostsController <ApplicationController
  get '/posts' do
    #binding.pry
    #raise session[:email].inspect
    "A list of publically available posts"
    #"You are logged in as #{session[:email]}"
  end

  get '/posts/new' do
    # Checking if they are logged in
    if !logged_in?
      redirect "/login" # Redirecting if they aren't
    else
      "A new post form" # Rendering if they are
    end
  end

  get '/posts/:id/edit' do
    # Checking if they are logged in
    if !logged_in?
      redirect "/login" # Redirecting if they aren't
    else
      # how do I find the post that only the author user is allowed to edit?
      #post = Post.find(params[:id])
      #if post.user_id == current_user.id
      if post = current_user.posts.find_by(params[:id])
        "An edit post form #{current_user.id} is editing #{post.id}" # Rendering if they are
      else
        redirect '/posts'
      end
    end
  end
end
