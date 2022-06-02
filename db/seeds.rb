# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning DB of previous records"
Chat.destroy_all
Ticket.destroy_all
User.destroy_all

puts "create first user"
user1 = User.new(
  email: "user@mail.com",
  password: "123456"
)

user1.save!

puts "create second user"
user2 = User.new(
  email: "user2@mail.com",
  password: "123456"
)
user2.save!

puts "create first user"
user3 = User.new(
  email: "user3@mail.com",
  password: "123456"
)

user3.save!

require "open-uri"

puts "creating tickets"

ticket1 = Ticket.new(
  title: ".each and map",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum laoreet sollicitudin sapien id dictum. Nam sit amet sapien libero. Fusce eu dolor ultricies, vulputate risus sollicitudin, fermentum sem. Donec vel risus suscipit, porta orci ac, vehicula leo. Nulla eu ligula vel felis elementum accumsan ut nec leo. Nunc tempor enim non porttitor congue. Aliquam maximus est eu nulla rutrum, et accumsan purus pharetra. Sed auctor eleifend scelerisque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non tristique urna. Aliquam et elit erat. Aliquam at aliquam lectus. Pellentesque sed mi sed urna mattis fermentum. Aliquam interdum enim orci, a malesuada odio bibendum in.",
  language: "Ruby",
  user: user1
)

ticket1.save

ticket2 = Ticket.new(
  title: "CSS",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum laoreet sollicitudin sapien id dictum. Nam sit amet sapien libero. Fusce eu dolor ultricies, vulputate risus sollicitudin, fermentum sem. Donec vel risus suscipit, porta orci ac, vehicula leo. Nulla eu ligula vel felis elementum accumsan ut nec leo. Nunc tempor enim non porttitor congue. Aliquam maximus est eu nulla rutrum, et accumsan purus pharetra. Sed auctor eleifend scelerisque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non tristique urna. Aliquam et elit erat. Aliquam at aliquam lectus. Pellentesque sed mi sed urna mattis fermentum. Aliquam interdum enim orci, a malesuada odio bibendum in.",
  language: "HTML",
  user: user1
)

ticket2.save

ticket3 = Ticket.new(
  title: "Sinatra",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum laoreet sollicitudin sapien id dictum. Nam sit amet sapien libero. Fusce eu dolor ultricies, vulputate risus sollicitudin, fermentum sem. Donec vel risus suscipit, porta orci ac, vehicula leo. Nulla eu ligula vel felis elementum accumsan ut nec leo. Nunc tempor enim non porttitor congue. Aliquam maximus est eu nulla rutrum, et accumsan purus pharetra. Sed auctor eleifend scelerisque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non tristique urna. Aliquam et elit erat. Aliquam at aliquam lectus. Pellentesque sed mi sed urna mattis fermentum. Aliquam interdum enim orci, a malesuada odio bibendum in.",
  language: "CSS",
  user: user2
)

ticket3.save

ticket4 = Ticket.new(
  title: "Wagon race",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum laoreet sollicitudin sapien id dictum. Nam sit amet sapien libero. Fusce eu dolor ultricies, vulputate risus sollicitudin, fermentum sem. Donec vel risus suscipit, porta orci ac, vehicula leo. Nulla eu ligula vel felis elementum accumsan ut nec leo. Nunc tempor enim non porttitor congue. Aliquam maximus est eu nulla rutrum, et accumsan purus pharetra. Sed auctor eleifend scelerisque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non tristique urna. Aliquam et elit erat. Aliquam at aliquam lectus. Pellentesque sed mi sed urna mattis fermentum. Aliquam interdum enim orci, a malesuada odio bibendum in.",
  language: "JavaScript",
  user: user2
)

ticket4.save

chat1 = Chat.new(user_id: user1.id, ticket_id: ticket4.id)
chat1.save!
chat2 = Chat.new(user_id: user3.id, ticket_id: ticket2.id)
chat2.save!

puts "Finished!...."
