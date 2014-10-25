class ChangeItemColumnsToText < ActiveRecord::Migration
  def change
    change_column :items, :summary, :text
    change_column :items, :cdata, :text
  end
end
