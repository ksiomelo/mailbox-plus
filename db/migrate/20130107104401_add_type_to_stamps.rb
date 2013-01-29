class AddTypeToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :stamp_type, :string
  end
end
