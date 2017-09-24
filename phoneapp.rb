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
 
 
 post '/index' do 
     first_name = params[:first_name] 
     last_name = params[:last_name] 
     street = params[:street] 
     city = params[:city] 
     state = params[:state] 
     zipcode= params[:zipcode] 
     phone_number = params[:phone_number]
db.exec("INSERT INTO public.phonebook(first_name, last_name, street, city, state, zipcode, phone_number) VALUES('#{first_name}', '#{last_name}', '#{street}', '#{city}', '#{state}', '#{zipcode}', '#{phone_number}')");
# redirect '/index?first_name=' + first_name + '&last_name' + last_name + '&street' + street + '&city' + city + '&state' + state + '&zip' + zip + '&phone_number' + phone_number
end
 
get '/' do 
    phonebook = db.exec("SELECT * FROM public.phonebook") 
    erb :index, locals: {phonebook: phonebook} 
end 
