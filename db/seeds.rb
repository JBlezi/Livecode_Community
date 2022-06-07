# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"



puts "Cleaning DB of previous records"
UserInformation.destroy_all
Review.destroy_all
Chat.destroy_all
Ticket.destroy_all
User.destroy_all



puts "creating users"

user1 = User.new(
  email: "user@mail.com",
  password: "123456"
)
user1.save
user1_profile = UserInformation.last
user1_profile.first_name = "Peter"
user1_profile.last_name = "Capusotto"
user1_profile.bio = "Starred in almost every game in the Peter series as well as three cartoons series, various TV adverts including McDonalds, milk for schools and lots of general Nintendo ads - he was also in a feature film called Super Peter Capusotto."
user1_profile.github_url = "https://github.com/"
user1_profile.save

user2 = User.new(
  email: "user2@mail.com",
  password: "123456"
)
user2.save
user2_profile = UserInformation.last
user2_profile.first_name = "Carlos"
user2_profile.last_name = "Williams"
user2_profile.bio = "Born on February 13, 1974, in Stoke-on-Trent, England. When he was 3 years old, his mother Janet divorced his father (entertainer Pete Conway). Growing up with his mother and stepsister, Sally, Williams rarely stayed out of trouble in school"
user2_profile.github_url = "https://github.com/"
user2_profile.save


user3 = User.new(
  email: "user3@mail.com",
  password: "123456"
)
user3.save!
user3_profile = UserInformation.last
user3_profile.first_name = "Mario"
user3_profile.last_name = "Calleja"
user3_profile.bio = "Refined contemporary R&B artist Mario debuted in his mid-teens with the Top Ten pop hit Just a Friend 2002. The deeply impassioned (and on-key) update of Biz Markie's humorous 1989 hit ignited a career highlighted by a string of high-performing albums for Clive Davis' J label."
user3_profile.github_url = "https://github.com/"
user3_profile.save




puts "creating tickets for user 1"

ticket1 = Ticket.new(
  title: ".each and map",
  content: "I dont really know what map does and each reacts to it.. Also i have issues knowing what the {|x| } means.",
  language: "Ruby",
  status: "closed",
  user: user1
)
ticket1.save

ticket2 = Ticket.new(
  title: "color of a-tag",
  content: "cant seem to change the color of the a tag in css. I tried text-decoration-none, but nothing works, pls help :D",
  language: "CSS",
  user: user1
)
ticket2.save

ticket6 = Ticket.new(
  title: "JS advanced debugging",
  content: "So I lauched a postgresql with rails and all referring stuff, but suddelny my animations doesn't work anymore. Please help",
  language: "JavaScript",
  status: "closed",
  user: user1
)
ticket6.save

ticket9 = Ticket.new(
  title: "Raspberry pi",
  content: "The data in the server is different  from the data I'm sending",
  language: "C",
  status: "open",
  user: user1
  )
  ticket9.save




puts "tickets for user2"


ticket3 = Ticket.new(
  title: "Animation issues",
  content: "So i have seen a tutorial of animating css styles. When I do exactly as they did, i get an error-message:
  /* Animation */
  #home-title > h1 {
    animation: animated-text 4s steps(28,end) 1s 1 normal both,
               animated-cursor 600ms steps(28,end) infinite;
  }
  
  .outline-button {
    animation-delay: 2s;
  }
  
  /* text animation */
  @keyframes animated-text{
    from{width: 0;}
    to{width: 550px;}
  }
  
  /* cursor animations */
  @keyframes animated-cursor{
    from{border-right-color: $first;}
    to{border-right-color: transparent;}
  }
  ",
  language: "CSS",
  status: "open",
  user: user2
)
ticket3.save

ticket4 = Ticket.new(
  title: "Heroku doesn't like my Javascript",
  content: "When I open heroku server I lost all the animation page, only work in my computer",
  language: "JavaScript",
  status: "open",
  user: user2
)
ticket4.save

ticket5 = Ticket.new(
  title: "I need help with variables",
  content: ".I want to convert my integer variable to a string and I can't find a easy solution",
  language: "Python",
  status: "open",
  user: user2
)
ticket5.save
  
  ticket8 = Ticket.new(
    title: "Place my boxes where I need",
    content: "I'm just want stuck my boxes in the middle of the screen but they always go to the left part",
    language: "CSS",
    status: "open",
    user: user2
  )
  ticket8.save

ticket10 = Ticket.new(
  title: "mapbox doesn't work",
  content: "I'm trying to add marging progressive after add the new address but always bringme to another part of the planet",
  language: "JavaScript",
  status: "open",
  user: user2
)
ticket10.save



puts "tickets for user3"

ticket7 = Ticket.new(
  title: "Print a hash without {}",
  content: "I want to print a clear value of my hashes but always apears the full hash in my screen and looks so bad",
  language: "Ruby",
  status: "open",
  user: user3
)
ticket7.save



puts "creating chats"

chat1 = Chat.new(user_id: user1.id, ticket_id: ticket4.id)
chat1.save
chat2 = Chat.new(user_id: user3.id, ticket_id: ticket2.id)
chat2.save

puts "Finished!...."
