get '/posts/new' do
  
  erb :post
end

get '/posts/:id' do
  @post=Post.find(params[:id])
  p @comments = Comment.where("post_id = ?", @post.id)
  erb :show_post_comments #also allows for adding comment?
end

post '/posts/:id' do

  redirect '/'
end

post '/posts' do
  @post = Post.new(params)
  @post.user = current_user
  @post.save
  redirect "/posts/#{@post.id}"

end

get '/posts/users/:id' do

  erb :show_all_user_posts
end
