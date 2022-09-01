class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
get '/messages' do
    created_at = Message.all
    created_at.to_json
  end  

  # get '/messages/:id' do
  #   updated_message = Message.find(params[:id])
  #   updated_message.to_json
  # end

  post '/messages' do
    new_message = Message.create(body: params[:body], username: params[:username])
    new_message.to_json
  end

  patch '/messages/:id' do
    updated_message = Message.find(params[:id])
    updated_message.update(body: params[:body])
    updated_message.to_json
  end

  delete '/messages/:id' do
    delete_message = Message.find(params[:id])
    delete_message.destroy
    delete_message.to_json
  end
end 
