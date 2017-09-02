class Message < ApplicationRecord
  belongs_to :user
  has_many :message_tags
  has_many :tags, through: :message_tags

end
