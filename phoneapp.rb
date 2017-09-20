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
     fname = params[:user_given_first_name] 
     lname = params[:user_given_last_name] 
     street = params[:user_given_street_address] 
     city = params[:user_given_city] 
     state = params[:user_given_state] 
     zip = params[:user_given_zip] 
     phone = params[:user_given_phone_number] 
     email = params[:user_given_email] 







db.exec("INSERT INTO phonebook(first_name, last_name, street_address, city, state, zip, cell_phone, home_phone, work_phone) VALUES('#{first_name}', '#{last_name}', '#{street_address}', '#{city}', '#{state}', '#{zip}', '#{cell_phone}', '#{home_phone}', '#{work_phone}')");