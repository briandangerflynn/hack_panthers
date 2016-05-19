# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Owner.create(name: "Brian",
            email: "bdflynny@gmail.com",
            password_digest: "kittycat",
            room_ids: "",
            video_url: "https://youtu.be/tntOCGkgt98",
            description: "I am a person and not a humanoid robot and please live at my apartment for good times.",
            has_pets: true)

Owner.create(name: "Ralph",
            email: "ralph@gmail.com",
            password_digest: "puppies123",
            room_ids: "",
            video_url: "https://youtu.be/G8KpPw303PY",
            description: "I am Ralph and I run around the city at night saving old ladies from violent thugs.",
            has_pets: true)

Owner.create(name: "Yuna",
            email: "yuna@gmail.com",
            password_digest: "ilovebunnies",
            room_ids: "",
            video_url: "https://youtu.be/9Mk_t78IeO8",
            description: "I am Yuna and one time I flipped over a truck with pure rage. Jealous?",
            has_pets: false)

Owner.create(name: "Rashish",
            email: "rashish@gmail.com",
            password_digest: "koalasRcool99",
            room_ids: "",
            video_url: "https://youtu.be/tLsLpLzvvn8",
            description: "I am Rashish and I once jumped over a moving train but no one saw it and my friends don't believe me :(.",
            has_pets: false)

Renter.create(name: "renter1",
              email: "renter1@gmail.com",
              password_digest: "renter1",
              room_ids: "",
              video_url: "https://youtu.be/PoxpVZ2KTYI",
              description: "I am a person who wants to rent an apartment room because indoors is nice.",
              has_pets: false)

Renter.create(name: "renter2",
              email: "renter2@gmail.com",
              password_digest: "renter2",
              room_ids: "",
              video_url: "https://youtu.be/PoxpVZ2KTYI",
              description: "I am a person who wants to rent an apartment room because indoors is nice.",
              has_pets: false)

Renter.create(name: "renter3",
              email: "renter3@gmail.com",
              password_digest: "renter3",
              room_ids: "",
              video_url: "https://youtu.be/PoxpVZ2KTYI",
              description: "I am a person who wants to rent an apartment room because indoors is nice.",
              has_pets: false)

Renter.create(name: "renter4",
              email: "renter4@gmail.com",
              password_digest: "renter4",
              room_ids: "",
              video_url: "https://youtu.be/PoxpVZ2KTYI",
              description: "I am a person who wants to rent an apartment room because indoors is nice.",
              has_pets: true)

Renter.create(name: "renter5",
              email: "renter5@gmail.com",
              password_digest: "renter5",
              room_ids: "",
              video_url: "https://youtu.be/PoxpVZ2KTYI",
              description: "I am a person who wants to rent an apartment room because indoors is nice.",
              has_pets: true)

Renter.create(name: "renter6",
              email: "renter6@gmail.com",
              password_digest: "renter6",
              room_ids: "",
              video_url: "https://youtu.be/PoxpVZ2KTYI",
              description: "I am a person who wants to rent an apartment room because indoors is nice.",
              has_pets: true)

Room.create(
            address: "1 Saint Nicholas Terrace, Apt 53",
            price: 925,
            video_url: "https://youtu.be/D7gZ0kNpFR8",
            pets_allowed: true,
            description: "A man died in here. I'm desperate to fill this room and move on.",
            title: "Great room, better roommates!",
            neighborhood: "West Harlem",
            borough: "Manhattan",
            available: true)

Room.create(
            address: "1025 Freeman St.",
            price: 700,
            video_url: "https://youtu.be/D7gZ0kNpFR8",
            pets_allowed: true,
            description: "The best room ever.",
            title: "Roommate with XBOX needed. STAT.",
            neighborhood: "Morrisania",
            borough: "Bronx",
            available: true)

Room.create(
            address: "1600 Pennsylvania Ave",
            price: 1000,
            video_url: "https://youtu.be/D7gZ0kNpFR8",
            pets_allowed: false,
            description: "Lovely, well designed room with a huge closet and fun roommates! Sometimes I tattoo people at night.",
            title: "Great room in a fun neighborhood",
            neighborhood: "Bushwick",
            borough: "Brooklyn",
            available: true)

Room.create(
            address: "35 Crown St.",
            price: 1500,
            video_url: "https://youtu.be/D7gZ0kNpFR8",
            pets_allowed: false,
            description: "Technically the room is a kitchen. You shouldn't feel obligated to cook, but I don't mind if you do.",
            title: "This room is hot!!",
            neighborhood: "Crown Heights",
            borough: "Brooklyn",
            available: true)

