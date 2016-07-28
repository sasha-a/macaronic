get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params['user'])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    p @errors
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = current_user
  erb :"/users/show"
end

delete '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(username: params['user'][:username])
  if @user && @user.authenticate(params['user'][:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = 'Something went wrong'
    erb :'users/login'
  end
end
