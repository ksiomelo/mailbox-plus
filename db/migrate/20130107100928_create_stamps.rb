class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.string :code, :null => false
      t.integer :user_id
      t.date :expires_at
      t.boolean :valid, :default => true

      t.timestamps
    end
  end
end
