get '/users/:id' do

  erb :profile
end

get '/users/:id/comments' do

  erb :show_all_user_comments
end

get '/login' do 

  erb :login_signup
end

post '/users' do
  user = User.find_by_username(params["username"])
  unless user
    @user = User.new(username: params["username"])
    @user.password = params["password"]
    @user.save
    session[:user_id] = @user.id
  end
  @user
  redirect '/'
end

post '/login' do
  @user = User.find_by_username(params["username"])
  if @user.password == params["password"]
    session[:user_id] = @user.id
  else
    redirect '/login'
  end
  redirect '/'
end
