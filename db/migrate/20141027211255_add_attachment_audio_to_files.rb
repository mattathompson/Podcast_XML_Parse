class AddAttachmentAudioToFiles < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :attachments, :audio
  end
end
