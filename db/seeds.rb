# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


for i in 1..50
	name = Faker::Name.first_name
	email = Faker::Internet.email

	user = User.new
	user.name = name
	user.email = email

	if user.save 
		for ii in 1..50
			article = Article.new
			article.user = user 
			article.title = Faker::Hipster.word
			article.content = Faker::Hipster.paragraph
			article.save
				if article.save
					for iii in 1..10
						comment = Comment.new
						comment.user = user
						comment.article = article
						comment.message = Faker::Hipster.paragraph
						comment.save
					end
				end
			end
		end
	end
