class CreateFiles < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :item_id
    end
  end
end
