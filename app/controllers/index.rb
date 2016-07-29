get '/' do
  erb :index
end

post '/' do
  sentence = params[:original_text]
  response = Unirest.get "https://yoda.p.mashape.com/yoda?sentence=#{sentence}",
  headers:{
    "X-Mashape-Key" => "G16eP2ZCXXmshMEuYPyGdGEg5pD6p15pMOGjsn4iSu7CJTrhed",
    "Accept" => "text/plain"
  }
  response.body
  # erb :index
end
