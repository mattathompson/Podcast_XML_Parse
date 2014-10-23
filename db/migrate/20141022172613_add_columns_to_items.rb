class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :subtitle, :string
    add_column :items, :category, :string
    add_column :items, :pubDate, :datetime
    add_column :items, :summary, :string
    add_column :items, :explicit, :string
    add_column :items, :duration, :string
    add_column :items, :keywords, :string

  end
end
