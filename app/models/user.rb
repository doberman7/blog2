class User < ApplicationRecord
  has_many :messages, dependent: :destroy#If you delete an article, its associated comments will also need to be deleted, otherwise they would simply occupy space in the database. Rails allows you to use the dependent option of an association to achieve this.
end
