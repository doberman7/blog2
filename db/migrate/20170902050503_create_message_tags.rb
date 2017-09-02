class CreateMessageTags < ActiveRecord::Migration[5.0]
  def change
    create_table :message_tags do |t|
      t.belongs_to :message, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
