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

puts "creating users"

user1 = User.new(
  email: "user@mail.com",
  password: "123456"
)
user1.save!
user1_profile = UserInformation.last
user1_profile.first_name = "Peter"
user1_profile.last_name = "Capusotto"
user1_profile.bio = "Peter has starred in almost every game in the Peter series as well as three cartoons series, various TV adverts including McDonalds, milk for schools and lots of general Nintendo ads - he was also in a feature film called Super Peter Capusotto."
user1_profile.github_url = "https://github.com/"
user1_profile.save!

user2 = User.new(
  email: "user2@mail.com",
  password: "123456"
)
user2.save!
user2_profile = UserInformation.last
user2_profile.first_name = "Carlos"
user2_profile.last_name = "Williams"
user2_profile.bio = "Carlos Williams was born Robert Peter Williams on February 13, 1974, in Stoke-on-Trent, England. When he was 3 years old, his mother Janet divorced his father (entertainer Pete Conway). Growing up with his mother and stepsister, Sally, Williams rarely stayed out of trouble in school"
user2_profile.github_url = "https://github.com/"
user2_profile.save!

user3 = User.new(
  email: "user3@mail.com",
  password: "123456"
)
user3.save!
user3_profile = UserInformation.last
user3_profile.first_name = "Mario"
user3_profile.last_name = "Calleja"
user3_profile.bio = "Mario has starred in almost every game in the Mario series as well as three cartoons series, various TV adverts including McDonalds, milk for schools and lots of general Nintendo ads - he was also in a feature film called Super Mario Bros."
user3_profile.github_url = "https://github.com/"
user3_profile.save!

require "open-uri"

puts "creating tickets"

ticket1 = Ticket.new(
  title: ".each and map",
  content: "I dont really know what map does and each reacts to it.. Also i have issues knowing what the {|x| } means.",
  language: "Ruby",
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
  user: user2
)
ticket3.save

ticket4 = Ticket.new(
  title: "Heroku doesnt like my Javascript",
  content: "Going nuts, too long to explain, pls just call, i'll pay extra",
  language: "JavaScript",
  user: user2
)
ticket4.save

ticket5 = Ticket.new(
  title: "I want to learn python",
  content: "...but I dont know how to start, pls give me a quick heads up on doing this so i dont waste
  time with stupid tutorials that teach me old stuff :)",
  language: "Python",
  user: user2
)
ticket5.save

ticket6 = Ticket.new(
  title: "JS advanced debugging",
  content: "So I lauched a postgresql with rails and all referring stuff, but suddelny my animations dont work anymore. Please help",
  language: "JavaScript",
  user: user1
)
ticket6.save

ticket7 = Ticket.new(
  title: "Lonely",
  content: "I am super lonely and need someone to talk and i like the community so I thought I'll give it a try.",
  language: "Vue",
  user: user3
)
ticket7.save

ticket8 = Ticket.new(
  title: "Rails goes noooo",
  content: "ActiveRecord::RecordNotFound in UserInformationsController#show wtfffff",
  language: "Ruby",
  user: user2
)
ticket8.save

ticket9 = Ticket.new(
  title: "App Issues",
  content: "i develeoped a small app in c, that shows an icon on your desktop. It should have a little button
  where I can add another color to a rainbow when i click it. Does someone know how i do it?
    This is what I have so far:
    
    Bricks game in C

#include <iostream.h>
#include <conio.h>
#include <ctype.h>
# include <process.h>
# include <dos.h>
# include <stdlib.h>
# include <graphics.h>
# include <stdio.h>

# define NULL 0
# define YES 1
# define NO 0
#define ESC	0x1b	 /* Define the escape key */

int MaxX, MaxY, MidX, MidY ;
int bri[5][20] ;

int    GraphDriver;	/* The Graphics device driver		 		 */
int    GraphMode;		/* The Graphics mode value		 		 */
double AspectRatio;	/* Aspect ratio of a pixel on the screen*/
int    MaxXX, MaxYY;	/* The maximum resolution of the screen */
int    MaxColors;		/* The maximum # of colors available		 */
int    ErrorCode;		/* Reports any graphics errors		 		 */
struct palettetype palette;	 /* Used to read palette info*/

// Initialize the graphics mode
void Initialize(void);

// Display the last screen of bricks
void SayGoodbye(void);

// Establish the main window for the demo
void MainWindow(char *header);

// Display the message Press any key to continue at last screen
void StatusLine(char *msg);

// Draws a boarder line at last screen
void DrawBorder(void);

// Changes the text style
void changetextstyle(int font, int direction, int charsize);

// Welcome screen of bricks game
mainscreen();

// Instruction messages of bricks game
screen();

// To display the bricks (in square box) and paddles in rectangle form and
bulbs rounded form
bricks();

// Delete a bricks when bulb hit it
delbrick(int,int);

// Echoes different musics
bell(int);

int graphmode = CGAHI, graphdriver = CGA, level;

main
()
{
		 union REGS ii, oo ;

		 int BallX, BallY, Base1, Base2, dx = 1, dy = -1, OldX, OldY ;
		 int totallayer[5] = { 10, 20, 30, 40, 50 }, max = 50, layer = 4 ;
		 int i, flag = 0, speed = 25, score = 0, chance = 4, areareq ;

		 char *m1, *m2 ;

		 /* Function to initialise the graphics mode */
		 initgraph ( &graphdriver, &graphmode,  ) ;
		 mainscreen();
		 /* get the maximum value of x and y coordinates of the screen */
		 MaxX = getmaxx() ;
		 MaxY = getmaxy() ;
		 /* finding the center of the screen */
		 MidX = MaxX / 2 ;
		 MidY = MaxY / 2 ;


		 /* create opening  screen and accept the level of the  player's  */
		 level = screen() ;

		 /* assign the  speed to ball as per the level chosen */
		 switch ( level )
		 {
		 		 case 'M' :
		 		 case 'm' :
		 		 		 speed = 15 ;
		 		 		 break ;

		 		 case 'F' :
		 		 case 'f' :
		 		 		 speed = 10 ;
		 }

		 /* draw the four layer of bricks, the paddle and the ball */
		 rectangle ( 0, 0, MaxX, MaxY - 12 ) ;
		 bricks() ;
		 rectangle ( MidX - 25, MaxY - 7 - 12, MidX + 25, MaxY - 12 ) ;
		 floodfill ( MidX, MaxY - 1 - 12, 12 ) ;
		 circle ( MidX, MaxY - 13 - 12, 12 ) ;
		 floodfill ( MidX, MaxY - 10 - 12, 12 ) ;

		 /* memory allocation for storing the image of the paddle */
		 areareq = imagesize ( MidX - 12, MaxY - 18, MidX + 12, MaxY - 8 ) ;
		 m1 =((char*) malloc ( areareq )) ;

		 /* memory allocation for storing the image of the ball */
		 areareq = imagesize ( MidX - 25, MaxY - 7, MidX + 25, MaxY - 1 ) ;
		 m2 =((char *) malloc ( areareq ) );

		 /* if unable to alloacte the memory  */
		 if ( m1 == NULL || m2 == NULL )
		 {;
		 		 exit ( 1 ) ;
		 }

		 /* image of the paddle and the ball is stored into allocated memory */
		 getimage ( MidX - 12, MaxY - 7 - 12 - 12 + 1, MidX + 12, MaxY - 8 - 12,
m1 ) ;
		 getimage ( MidX - 25, MaxY - 7 - 12, MidX + 25, MaxY - 1 - 12, m2 ) ;

		 /* store current position of the paddle and ball */
		 Base1 = MidX - 25 ;
		 Base2 = MaxY - 7 - 12 ;
		 BallX = MidX - 12 ;
		 BallY = MaxY - 7 - 12 + 1 - 12 ;
",
  language: "C",
  user: user1
)
ticket9.save

ticket10 = Ticket.new(
  title: "I hate each and every coding language",
  content: "If you help me solve my issue i will cry and make you my god. 
  Let me explain you online, please dont judge me for crying from time to time",
  language: "TypeScript",
  user: user2
)
ticket10.save

puts "creating tickets"

chat1 = Chat.new(user_id: user1.id, ticket_id: ticket4.id)
chat1.save!
chat2 = Chat.new(user_id: user3.id, ticket_id: ticket2.id)
chat2.save!

puts "Finished!...."
