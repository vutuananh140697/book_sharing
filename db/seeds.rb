User.create!([
  {email: "vu.thu.hien@gmail.com",
   password: "hien123", password_confirmation: "hien123",
   name: "Vu Thu Hien", username: "hienvu", is_admin: 1,
   image: File.open(Rails.root + "public/uploads/image/user1.jpg")
  },
  {email: "nguyen.xuan.thien@gmail.com",
   password: "thien123", password_confirmation: "thien123",
   name: "Nguyen Xuan Thien", username: "xuanthien",
   image: File.open(Rails.root + "public/uploads/image/user2.jpg")
  },
  {email: "kumekawa.kanau@gmail.com",
   password: "kumekawa123", password_confirmation: "kumekawa123",
   name: "Kumekawa Kanau", username: "kumekawa",
   image: File.open(Rails.root + "public/uploads/image/user4.jpg")
  },
  {email: "watanabe.hikaru@gmail.com",
   password: "hikaru123", password_confirmation: "hikaru123",
   name: "Watanabe Hikaru", username: "hikaru",
   image: File.open(Rails.root + "public/uploads/image/user3.jpg")
  },
  {email: "admin@gmail.com",
   password: "admin123", password_confirmation: "admin123",
   name: "Admin", username: "admin", is_admin: 1,
   image: File.open(Rails.root + "public/uploads/image/profile_default.png")
  }
])

10.times do |n|
  User.create!(
    email: Faker::Name.first_name+n.to_s+"@gmail.com",
    password: "user123", password_confirmation: "user123",
    name: Faker::Name.name, username: Faker::JapaneseMedia::SwordArtOnline.game_name, is_admin: 0,
    image: File.open(Rails.root + "public/uploads/image/profile_default.png")
  )
end

10.times do |n|
  Category.create!(title: Faker::Book.genre)
end

20.times do |n|
  Author.create!(
    name: Faker::Name.name,
    bio: Faker::Lorem.paragraph)
end

20.times do |n|
  Book.create!(
    title: Faker::Book.title,
    isbn: Faker::Number.number(9),
    publisher: Faker::Book.publisher,
    publish_date: Faker::Date.between(7.years.ago, Date.today),
    description: Faker::Lorem.paragraph(1),
    picture: File.open(Rails.root + "public/uploads/image/book_default.jpg"),
  )
end

50.times do |n|
  BookCategory.create!(
    book_id: Faker::Number.between(1,20),
    category_id: Faker::Number.between(1,10)
  )
end

# 15.times do |n|
#   AuthorBook.create!(
#     book_id: Faker::Number.between(1,20),
#     author_id: Faker::Number.between(1,10)
#   )
# end

books = Book.all
users = User.all

users.each do |user|
  books.each do |book|
    Review.create!(
        title: Faker::Book.title+"  "+Faker::Book.author,
        content: Faker::Lorem.paragraph(5),
        user_id: user.id,
        book_id: book.id
      )

    Rate.create!(
        user_id: user.id,
        book_id: book.id,
        score: Faker::Number.between(1, 4),
    )
  end
end

books.each do |book|
  AuthorBook.create!(
    book_id: book.id,
    author_id: Faker::Number.between(1,10)
  )
  4.times do |n|
    BookCategory.create!(
      book_id: book.id,
      category_id: Faker::Number.between(1,10)
    )
  end
end

Book.create!([
  {title: "Thinking, Fast and Slow",
    isbn: Faker::Number.number(9),
    publisher: Faker::Book.publisher,
    publish_date: "25-10-2011",
    description: "In the highly anticipated Thinking, Fast and Slow, Kahneman takes us on a groundbreaking tour of the mind and explains the two systems that drive the way we think. System 1 is fast, intuitive, and emotional; System 2 is slower, more deliberative, and more logical. Kahneman exposes the extraordinary capabilities—and also the faults and biases—of fast thinking, and reveals the pervasive influence of intuitive impressi.
Engaging the reader in a lively conversation about how we think, Kahneman reveals where we can and cannot trust our intuitions and how we can tap into the benefits of slow thinking. He offers practical and enlightening insights into how choices are made in both our business and our personal lives—and how we can use different techniques to guard against the mental glitches that often get us into trouble. Thinking, Fast and Slow will transform the way you think about thinking",
    picture: File.open(Rails.root + "public/uploads/image/book21.jpg"),
  },
  {title: "No Longer Human",
    isbn: Faker::Number.number(9),
    publisher: "New Directions",
    publish_date: "17-01-1958",
    description: "Osamu Dazai's No Longer Human, this leading postwar Japanese writer's second novel, tells the poignant and fascinating story of a young man who is caught between the breakup of the traditions of a northern Japanese aristocratic family and the impact of Western ideas. In consequence, he feels himself \"disqualified from being human\" (a literal translation of the Japanese title).
Donald Keene, who translated this and Dazai's first novel, The Setting Sun, has said of the author's work: \"His world … suggests Chekhov or possibly postwar France, … but there is a Japanese sensibility in the choice and presentation of the material. A Dazai novel is at once immediately intelligible in Western terms and quite unlike any Western book.\" His writing is in some ways reminiscent of Rimbaud, while he himself has often been called a forerunner of Yukio Mishima.",
    picture: File.open(Rails.root + "public/uploads/image/book22.jpg"),
  },
  {title: "What If?",
    isbn: Faker::Number.number(9),
    publisher: "Houghton Mifflin Harcourt",
    publish_date: "2-9-2014",
    description: "If your cells suddenly lost the power to divide, how long would you survive?

How dangerous is it, really, to be in a swimming pool in a thunderstorm?

If we hooked turbines to people exercising in gyms, how much power could we produce?

What if everyone only had one soulmate?

When (if ever) did the sun go down on the British empire?

How fast can you hit a speed bump while driving and live?

What would happen if the moon went away?",
    picture: File.open(Rails.root + "public/uploads/image/book23.jpg"),
  },
  {title: "The Power of Habit",
  isbn: Faker::Number.number(9),
  publisher: "Houghton Mifflin Harcourt",
  publish_date: "2-9-2014",
  description: "In The Power of Habit, award-winning New York Times business reporter Charles Duhigg takes us to the thrilling edge of scientific discoveries that explain why habits exist and how they can be changed. With penetrating intelligence and an ability to distill vast amounts of information into engrossing narratives, Duhigg brings to life a whole new understanding of human nature and its potential for transformation.
.",
  picture: File.open(Rails.root + "public/uploads/image/book24.jpg")},
  {title: "The 7 Habits of Highly Effective People",
  isbn: Faker::Number.number(9),
  publisher: "Houghton Mifflin Harcourt",
  publish_date: "9-11-2004",
  description: "There are two main problems here, and we are talking only about the people who have read the book already. The first problem is that most people are too lazy to implement the ideals of Stephen Covey in their lives. They consider his masterpiece of a book as a mere coffee-table book or a book that you use for light reading when you are traveling and then forget all about it. They do not realize that this book contains life-changing information. Or, they take the information and do not make the effort to actually utilize it so that it becomes knowledge for them.",
  picture: File.open(Rails.root + "public/uploads/image/book25.jpg")},
])

Author.create!([
  {name: "Osamu Dazai",
  bio: "Osamu DAZAI (太宰 治, real name Shūji TSUSHIMA) was a Japanese author who is considered one of the foremost fiction writers of 20th-century Japan. A number of his most popular works, such as Shayō (The Setting Sun) and Ningen Shikkaku (No Longer Human), are considered modern-day classics in Japan."},
  {name: "Daniel Kahneman",
  bio: "Daniel Kahneman (Hebrew: דניאל כהנמן (born 5 March 1934) is an Israeli-American psychologist and winner of the 2002 Nobel Memorial Prize in Economic Sciences, notable for his work on behavioral finance and hedonic psychology."},
])

AuthorBook.create!([
  {book_id: 22,
  author_id: 21},
  {book_id: 21,
  author_id: 22},
  {book_id: 23,
  author_id: Faker::Number.between(10,20)},
  {book_id: 24,
  author_id: Faker::Number.between(10,20)},
  {book_id: 25,
  author_id: Faker::Number.between(10,20)}
])

Rate.create!([
  {user_id: 1,
  book_id: 21,
  score: 5},
  {user_id: 2,
  book_id: 21,
  score: 4},
  {user_id: 3,
  book_id: 21,
  score: 5},
  {user_id: 4,
  book_id: 21,
  score: 5},
  {user_id: 1,
  book_id: 22,
  score: 5},
  {user_id: 2,
  book_id: 22,
  score: 4},
  {user_id: 3,
  book_id: 22,
  score: 4},
  {user_id: 4,
  book_id: 22,
  score: 5},
  {user_id: 5,
  book_id: 22,
  score: 5},
  {user_id: 1,
  book_id: 24,
  score: 5},
  {user_id: 2,
  book_id: 24,
  score: 4},
  {user_id: 3,
  book_id: 24,
  score: 5},
  {user_id: 4,
  book_id: 24,
  score: 4},
  {user_id: 4,
  book_id: 24,
  score: 4},
])

Review.create!([
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(20),
  user_id: 5,
  book_id: 21},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(20),
  user_id: 3,
  book_id: 21},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(20),
  user_id: 2,
  book_id: 22},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(20),
  user_id: 3,
  book_id: 25},
  {title: "This is one of the most entertaining books I have ever read.",
  content: "I've been a reader of XKCD for ages. Not just a reader, a fan. A big goey, geeky fan.

So much of a fan that when I heard about this book, I went so far as to abuse my power as an author to get an Advance Reading Copy of the book, so that I could enjoy its deliciousness sooner. And... y'know... taunt people on the internet.

And it worked. I got an early copy. And I treasured it. I petted it. It was precious to me. Precious.

Then life got in the way. Conventions. Promotion for my own book launch. I had dad stuff to do. I had prep work for the yearly Worldbuilders fundraiser. Then I had my book tour....

Through all of this, I carried my precious ARC around, waiting for the time when I'd be able to spare the brainpower to read it. I even took it on tour with me. (Honestly, this book has more frequent flier miles than any three of you put together.)",
  user_id: 4,
  book_id: 23},
  {title: "This is a fascinating book.",
  content: "Reading this book means not having to read so many others. For example, you could avoid having to read, Sway, Blink, Nudge and probably a dozen or so other books on Behavioural Economics. And the best part of it is that this is the guy (or, at least one half of the two guys) who came up with these ideas in the first place.

I was thinking that perhaps the best way to explain those other books would be to compare them to Monty Python. I want you to imagine something - say you had spent your entire life and never actually seen an episode of Monty Python's Flying Circus. That wouldn't mean you wouldn't know anything about Monty Python. It is impossible to have lived at any time since the late 60s and not have had some socially dysfunctional male reprise the entire Parrot sketch or Spanish Inquisition sketch at you at some stage in your life. I suspect, although there is no way to prove this now, obviously, that Osama bin Laden could do the Silly Walk like a natural. Well, if you had never seen an episode of Monty Python and your entire experience of their work was via the interpretation of men of a certain age down the pub - then finally getting to see an episode of the original would be much the same effect as reading this book. Hundreds of people have already told all this guy's best stories in their own books - but all the same it is a pleasure to hear them again by the guy that first said, 'this parrot is dead' or rather, 'framing effects make fools of us all'.",
  user_id: 1,
  book_id: 21},
  {title: "Nothing Succeeds Like Success: A Case Study",
  content: "Hey. Have you heard of Thomas Baker? How about Carol Wright? Chris Cameron? Vineet Shaw? Let us discuss Baker.

Thomas Baker was an average joe, but not without ambitions. A few years ago, acting on a tip, Tom, a competitive enough guy, decided to take his life into his own hands. What’s more, he decided to pick up one more Self-help book and this time follow up thoroughly on it. No holds barred. He asked around, looked in that wonderful site and finally decided on what seemed to him like the best out there right now. The ratings seemed to be out of the world too. The author, in the intro, even tries to reassure him against feeling overwhelmed by the excess of research in the book. This is exactly the sort of help that Tom needed.

Tom read the book with great diligence. He made notes and he made placards and he even bought magnets for his fridge and special sticky tapes for his mirrors. He knew this could work. He only had to believe.

He changed his routines, identified and included habit-forming cues. He created them, he played around with them, he even had some fun. He was very inventive and imaginative. The author would have commended the effort if he knew. Tom decide that he would write to Duhigg about his success once it pays off. ",
  user_id: 5,
  book_id: 24},
])

BookCategory.create!([
  {book_id: 21,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 21,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 21,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 22,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 22,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 22,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 23,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 23,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 23,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 24,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 24,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 24,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 25,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 25,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 25,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 21,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 22,
  category_id: Faker::Number.between(1, 10)},
  {book_id: 22,
  category_id: Faker::Number.between(1, 10)},
])

50.times do |n|
  Like.create!(
    review_id: Faker::Number.between(301, 307),
    user_id: Faker::Number.between(11, 20),
  )
end
