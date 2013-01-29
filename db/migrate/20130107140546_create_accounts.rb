class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :balance, :default => 0
      t.integer :user_id, :null =>false

      t.timestamps
    end
  end
end
