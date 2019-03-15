# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'Anonymous', email: 'guest@askmate.com',
            password_digest: BCrypt::Password.create(SecureRandom.uuid))

# Sample users:

user = User.create(
  username: 'Anna94', email: 'anna7169@doesnotexist.tv',
  first_name: 'Anna', last_name: 'Smith', birthday: Date.new(1994, 7, 12),
  password_digest: BCrypt::Password.create(SecureRandom.uuid)
)

user2 = User.create(
  username: 'HodiM', email: 'hodi.m@doesnotexist.tv',
  first_name: 'Máté', last_name: 'Hódi', birthday: Date.new(1991, 5, 26),
  password_digest: BCrypt::Password.create(SecureRandom.uuid)
)

user3 = User.create(
  username: 'SPENCE', email: 'spencestrong@doesnotexist.tv',
  first_name: 'Spencer', last_name: 'Strong', birthday: Date.new(1987, 5, 4),
  password_digest: BCrypt::Password.create(SecureRandom.uuid)
)

# Sample questions:

Question.create(
  title: 'How to reduce the number of DB connections',
  message: '
In my project we have 800 automated test cases and for every test case we follow below approach 1.Open a DB connection 2.Run the query based on the test case 3.Close the DB connection
Above step repeats for 800 times as we have 800 cases, is there any other alternate way to reduce the number of DB open and close connections?
Actually we tried like this open DB connection once then run all the test cases ( i.e running the queries) then closing the connection at last but we are seeing issues in this approach,So please suggest on this.
  ', user_id: user.id
)

Question.create(
  title: 'BigQuery Standard SQL: Delete Duplicates from Table',
  message: '
I am using below query to delete duplicates records from BigQuery using standard sql. but it is throwing error

with cte as (
select * ,row_number()over (partition by CallRailCallId order by CallRailCallId) as rn
from `encoremarketingtest.EncoreMarketingTest.CallRailCall2` )
--select *
delete
from (select * from cte
where rn>1)
  ', user_id: user.id
)

Question.create(
  title: 'Wordpress loading multiple jQuery Versions',
  message: '
I developed a plugin that uses the jquery booklet plugin (http://builtbywill.com/booklet/#/) this plugin binds a function to $ so I cann call $("".myBook"").booklet();

I could easy managing the loading order with wp_enqueue_script so first I load jquery then I load booklet so everything is fine.

BUT in my theme i also using jquery via webpack so the loading order is now following:

jquery
booklet
app.js (bundled file with webpack, including jquery)
  ', user_id: user2.id
)

Question.create(
  title: 'How to make lists in Python?',
  message: 'I am totally new to this, any hints?',
  user_id: user3.id
)

Question.create(
  title: 'Should I get this tattoo?',
  message: "
I'm thinking of getting a tattoo like the one on the attached pic.

Should I do it guys?
  ", user_id: user3.id,
  image: 'https://i.pinimg.com/originals/7b/0d/0b/7b0d0ba3e494423aaf17367118bc1de0.jpg'
)

question = Question.create(
  title: 'What does the Codecool logo depict?',
  message: '
See the attached pic.

What is this supposed to be?
  ', user_id: user2.id,
  image: 'https://codecoolstatic.s3.amazonaws.com/wp-content/uploads/2018/04/codecool_symbol_flat.png'
)

Answer.create(
  message: 'Not sure, but it looks similar to SoloLearn\'s logo.',
  image: 'https://www.sololearn.com/images/fb-story-icon.jpg',
  question_id: question.id,
  user_id: user.id
)

Answer.create(
  message: 'It\'s a lifesaver, you dummy.',
  image: 'http://images.all-free-download.com/images/graphiclarge/life_saver_clip_art_23262.jpg',
  question_id: question.id,
  user_id: user3.id
)
