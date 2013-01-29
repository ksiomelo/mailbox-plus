class AddNameToMailboxes < ActiveRecord::Migration
  def change
    add_column :mailboxes, :name, :string#, :null =>false
  end
end
