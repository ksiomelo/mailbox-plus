class Stamp < ActiveRecord::Base
  attr_accessible :code, :expires_at, :user_id, :valid, :stamp_type
  
  before_create :create_unique_id
  
  belongs_to :user
  
  def create_unique_id
    begin
      self.code = SecureRandom.hex(5) # or whatever you chose like UUID tools
    end while self.class.exists?(:code => self.code)
  end
  
  
  STAMP_TYPES = %w[national international]
  
  def is?(stamp_type)
    stamp_types.include?(stamp_type.to_s)
  end
  
end
