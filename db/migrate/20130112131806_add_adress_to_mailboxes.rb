class AddAdressToMailboxes < ActiveRecord::Migration
  def change
    add_column :mailboxes, :latitude, :float
    add_column :mailboxes, :longitude, :float
    add_column :mailboxes, :street, :string
    add_column :mailboxes, :complement, :string
    add_column :mailboxes, :city, :string
    add_column :mailboxes, :state, :string
    add_column :mailboxes, :country, :string
    add_column :mailboxes, :zipcode, :string
  end
end
