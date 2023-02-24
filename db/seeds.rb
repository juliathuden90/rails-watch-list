# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

# Destroy Bookmarks

puts "Destroying all bookmarks"
Bookmark.destroy_all
puts "All Bookmarks sucessfully destroyed"

# Destroy Lists

puts "Destroying all lists"
List.destroy_all
puts "All List sucessfully destroyed"

# Destroy Moview

puts "Destroying all movies"
Movie.destroy_all
puts "All movies sucessfully destroyed"

# Create Movies

movie_one = Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
movie_two = Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
movie_three = Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
movie_four = Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

puts "Created #{Movie.count} movies"

# Create Lists

file_one = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
list_one = List.new(name: "Action")
list_one.photo.attach(io: file_one, filename: "one.png", content_type: "image/png")
list_one.save

file_two = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
list_two = List.new(name: "Comedy")
list_two.photo.attach(io: file_two, filename: "two.png", content_type: "image/png")
list_two.save

puts "Created #{List.count} lists"

# Create Bookmarks

Bookmark.create(comment: "This is a test comment", movie_id: movie_one.id, list_id: list_one.id)
Bookmark.create(comment: "This is another test comment", movie_id: movie_two.id, list_id: list_one.id)
Bookmark.create(comment: "First comment for this list", movie_id: movie_three.id, list_id: list_two.id)

puts "Created #{Bookmark.count} bookmarks"
