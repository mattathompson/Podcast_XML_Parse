class AddAndRemoveColumnsFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :summary
    add_column :items, :audio_dir, :string
    add_column :items, :podcast_dir, :string
  end
end
