class User < ActiveRecord::Base
has_many :playlist
has_many :songs

  # def self.song_by_mood(mood)
  #   Song.all.select do |songs|
  #     songs.mood == mood
  #   end
  # end






  # def song_by_name
  #   self.map do |songs|
  #     songs.name
  #   end
  # end

# mood = gets.chomp
# puts "heres song for your mood"
# User.find_by_moods(mood).find do |song|
#   song
# end
# song.song_name




end
