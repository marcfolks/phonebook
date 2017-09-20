require "sinatra"

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
     phonebook = db.exec("Select * From user_given_data_table") 
     erb :index, locals: {phonebook: phonebook} 
 end 
 
 
 post '/index' do 
     fname = params[:fname] 
     lname = params[:lname] 
     street = params[:street] 
     city = params[:city] 
     state = params[:state] 
     zip = params[:zipc] 
     phone = params[:phone_number]
   







db.exec("INSERT INTO phonebook(first_name, last_name, street_address, city, state, zip, cell_phone, home_phone, work_phone) VALUES('#{fname}', '#{lname}', '#{street}', '#{city}', '#{state}', '#{zip}', '#{phone}')");
 end