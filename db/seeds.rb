# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'random_data'


16.times do
    # create! creates Posts that raise an error with !
    Post.create!(
        # RandomData will create random strings.
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end

post = Post.all 

30.times do 

    Comment.create!(
        post: post.sample, # picks a random post to comment on
        body: RandomData.random_paragraph
    )
end

Post.find_or_create_by(
    title: 'Unique Title',
    body: 'Unique Body'
)

Comment.find_or_create_by(
    post: post.find_by(body: 'Unique Body'),
    body: 'Unique Comment'
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

