class AddFtpFieldsForItems < ActiveRecord::Migration
  def change
    add_column :items, :address, :string
    add_column :items, :username, :string
    add_column :items, :password, :string
  end
end
