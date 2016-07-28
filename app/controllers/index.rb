get '/' do
  erb :index
end

post '/' do
  # sentence = "Jedi+must+use+the+force"
  # request_url = URI.parse("https://yoda.p.mashape.com/yoda?sentence=#{sentence}")
  sentence = params[:original_text]
  # p sentence
  response = Unirest.get "https://yoda.p.mashape.com/yoda?sentence=#{sentence}",
  headers:{
    "X-Mashape-Key" => "G16eP2ZCXXmshMEuYPyGdGEg5pD6p15pMOGjsn4iSu7CJTrhed",
    "Accept" => "text/plain"
  }
  response.body
  # p @printable_response
  # erb :index
end
