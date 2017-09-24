require "sinatra"
enable :sessions
require 'pg'

 load './local_env.rb' if File.exist?('./local_env.rb') 
 
 
 db_params = { 
     host: ENV['host'], 
     port: ENV['port'],      
     dbname: ENV['db_name'], 
     user: ENV['user'], 
     password: ENV['password'] 
 } 
 
 
 db = PG::Connection.new(db_params) 
 
 
 get '/' do 
     phonebook = db.exec("Select * From phonebook") 
    
     erb :index, locals: {phonebook: phonebook} 

 end 
 
 
 post '/' do 
     first_name = params[:first_name] 
     last_name = params[:last_name] 
     street = params[:street] 
     city = params[:city] 
     state = params[:state] 
     zipcode = params[:zipcode] 
     phone_number = params[:phone_number]
     db.exec("INSERT INTO public.phonebook(first_name, last_name, , city, state, zipcode, phone_number) VALUES('#{first_name}', '#{last_name}', '#{street}', '#{city}', '#{state}', '#{zipcode}', '#{phone_number}')");
    # redirect '/index?first_name=' + first_name.to_s + "&last_name=" + last_name.to_s + "&street=" + street.to_s + "&city=" + city.to_s + "&state=" + state.to_s + "&zipcode=" + zipcode.to_s + "&phone_number=" + phone_number.to_s
 end
get '/index' do
    phonebook = db.exec("Select * From phonebook")
    erb :index, locals: {phonbook: phonebook}
end
post '/index' do 
    session[:first_name] = params[:first_name] 
    session[:last_name] = params[:last_name] 
    session[:street] = params[:street] 
    session[:city] = params[:city] 
    session[:state] = params[:state] 
    session[:zipcode] = params[:zipcode] 
    session[:phone_number] = params[:phone_number]
    db.exec("Pull From public.phonebook(first_name, last_name, , city, state, zipcode, phone_number) VALUES('#{first_name}', '#{last_name}', '#{street}', '#{city}', '#{state}', '#{zipcode}', '#{phone_number}')");
end

