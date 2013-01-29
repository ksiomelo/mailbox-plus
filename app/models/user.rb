class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
         
  before_save :ensure_authentication_token
  
  before_create :create_account

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :address, :phone, :birthday, :role
  
  has_many :stamps
  has_one :account
  has_many :mailboxes
  
  has_private_messages
  
  ROLES = %w[admin postman client company banned]
  
  def is?(role)
    (self.role.to_s == role.to_s)
  end
  
  def create_account
    self.account = Account.new
  end
  
  
end
