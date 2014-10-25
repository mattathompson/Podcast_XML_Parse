class ChangeItemColumns < ActiveRecord::Migration
  def change
    add_column :items, :cdata, :string
    add_column :items, :keywords, :string
    add_column :items, :summary, :string
  end
end
