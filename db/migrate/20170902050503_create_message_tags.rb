class CreateMessageTags < ActiveRecord::Migration[5.0]
  def change
    create_table :message_tags do |t|
      t.references :message,  foreign_key: true
      t.references :tag,  foreign_key: true

      t.timestamps
    end
  end
end
