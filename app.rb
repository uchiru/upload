require 'sinatra'

get '/' do
  "hello"
end

post '/' do
  filename = params[:file][:filename]
  file = params[:file][:tempfile]

  File.open(File.join(ENV["STORE_DIR"] || "store", filename), 'wb') do |f|
    f.write(file.read)
  end
  
  {filename: filename}.to_json + "\n"
end
