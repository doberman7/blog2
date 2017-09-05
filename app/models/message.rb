class Message < ApplicationRecord
  belongs_to :user
  has_many :message_tags
  has_many :tags, through: :message_tags
  before_save { self.autor = autor.downcase}
  before_save { self.title = title.downcase}
  before_save { self.text = text.downcase}

end
