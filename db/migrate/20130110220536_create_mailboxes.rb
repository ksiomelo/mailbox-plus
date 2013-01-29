class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table :mailboxes do |t|
      t.integer :user_id, :null => false
      t.string :qrcode

      t.timestamps
    end
  end
end
