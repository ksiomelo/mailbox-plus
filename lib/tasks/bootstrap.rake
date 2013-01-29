namespace :bootstrap  do
  desc "Create superusers"
  task :init => :environment do
      User.create(:email => "admin@mailboxplus.com", :first_name => "Admin",
                    :last_name => "", :password => "administrator", :password_confirmation=>"administrator", :role => "admin" )
      
     User.create(:email => "postman@mailboxplus.com", :first_name => "Postman",
                  :last_name => "", :password => "postman", :password_confirmation=>"postman", :role => "postman" )
                    
  end
end