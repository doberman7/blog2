require "faker"

# 10.times do
	p u = User.create!(name: Faker::Friends.character, email: "ivanrubioangeles@gmail.com", password: "123456")
# end

10.times do
	p Message.create!(autor: Faker::Friends.character,title: Faker::Music.instrument, text: Faker::ChuckNorris.fact, user_id: u.id)
	p Tag.create!(name: Faker::Name.unique.name)
end
10.times do
	p MessageTag.create!(tag_id: Faker::Number.between(1, 10) ,message_id: Faker::Number.between(1, 10))
end
