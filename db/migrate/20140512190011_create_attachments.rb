class CreateAttachments < ActiveRecord::Migration
    def change
      create_table :attachments do |t|
        t.string :name
        t.string :type
        t.string :path
        t.text :descrption

        t.timestamps
      end
    end
    def down
      drop_table :attachments
    end

end
