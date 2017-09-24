def infosave
   infos=db.exec("INSERT INTO public.phonebook(first_name, last_name, , city, state, zipcode, phone_number) VALUES('#{first_name}', '#{last_name}', '#{street}', '#{city}', '#{state}', '#{zipcode}', '#{phone_number}')");
end

