get '/post/:id' do

  erb :show_post_with_comments #also allows for adding comment?
end

post '/post/:id' do

  redirect '/'
end

get '/posts/new' do
  erb :post

end



post '/posts' do
  @post = Post.new(params)
  @post.save
  redirect "/post/#{@post.id}"

end

get '/posts/users/:id' do

  erb :show_all_user_posts
end
