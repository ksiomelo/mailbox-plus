class Account < ActiveRecord::Base
  attr_accessible :balance, :user_id
  
  belongs_to :user
end
