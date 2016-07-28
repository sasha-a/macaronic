get '/' do
  sentence = "Jedi+must+use+the+force"
  request_url = URI.parse("https://yoda.p.mashape.com/yoda?sentence=#{sentence}")
  req = Net::HTTP::Get.new(request_url.path)

  req.add_field("X-Mashape-Key", "G16eP2ZCXXmshMEuYPyGdGEg5pD6p15pMOGjsn4iSu7CJTrhed")
  req.add_field("Accept", "text/plain")

  api_request = Net::HTTP.new(request_url.host, request_url.port)

  api_request.use_ssl = true

  api_request.start do |http|
    response = http.request(req)
    p response
  end

  erb :index
end

