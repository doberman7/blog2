class Tag < ApplicationRecord
  has_many :message_tags
  has_many :messages, through: :message_tags
  before_save { self.name = name.downcase }
end
