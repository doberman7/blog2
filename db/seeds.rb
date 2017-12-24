require "faker"

# 10.times do
	User.create!(name: Faker::Friends.character, email: "ivanrubioangeles@gmail.com", password: "123456")
# end

10.times do
	p User.create!(name: Faker::Friends.character, email: Faker::Internet.email , password: "123456")
end

id = 1
10.times do
	p Message.create!(autor: Faker::Friends.character,title: Faker::Music.instrument, text: Faker::ChuckNorris.fact, user_id: id = id + 1)
	p Tag.create!(name: Faker::Name.unique.name)
	p Game.create!(number: id, datetime: DateTime.now, user_id: id)
end

10.times do
	p MessageTag.create!(tag_id: Faker::Number.between(1, 10) ,message_id: Faker::Number.between(1, 10))
end
