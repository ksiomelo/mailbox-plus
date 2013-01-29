require 'qrcode'

class Mailbox < ActiveRecord::Base
  
  
  geocoded_by :full_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  
  attr_accessible :qrcode, :user_id, :name, :street, :city, :country, :state, :zipcode, :complement, :latitude, :longitude
  
  belongs_to :user
  
  after_create :generate_qrcode
  
  validates_presence_of :name
  
  
  def generate_qrcode
    # generates the qrcode image based on the assigned id of the object and returns its path
    codepath =LibQRCode.generate_qrcode(self.id.to_s + "#" + self.user.id.to_s + "#"  + self.user.first_name + " "+self.user.last_name, {:size => 3}) # size 2 will fit a 24 char string which is enough
    
    # save image path
    self.update_attribute(:qrcode, codepath)
  end
  
  
  def full_address 
    return self.street + ", " + self.city + ", "+ self.country
  end
  
end
