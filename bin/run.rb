require_relative '../config/environment'



def greeting
puts "Please enter your name to create your playlist:"
user_name = gets.chomp
@user = User.create(name: user_name)
puts "WELCOME #{user_name.upcase} TO THE 6 GOD PLAYLIST GENERATOR"
# $stdout.flush

puts "
_¶¶¶_¶¶_¶¶¶¶
¶__¶¶_¶¶___¶¶
¶___¶¶__¶¶___¶¶
¶_¶___¶¶___¶____¶_¶¶
¶_¶¶¶__¶¶___¶¶___¶¶_¶
¶_¶__¶___¶___¶¶___¶__¶
¶¶¶¶_¶¶___¶¶__¶¶__¶__¶
¶__¶__¶¶___¶___¶___¶_¶¶
¶__¶___¶____¶___¶___¶_¶¶
¶___¶___¶___¶¶__¶¶___¶__¶
¶¶___¶¶__¶¶___¶____¶_____¶
¶___¶_¶___¶¶______________¶
¶¶__¶¶_¶___¶______________¶¶
_¶___¶_¶___________________¶
__¶___¶_¶__________________¶
___¶___¶¶¶_________________¶
____¶_¶__¶_________________¶¶
____¶____¶¶_________________¶
____¶_____¶_________________¶
____¶¶____¶__________________¶
_____¶_____¶_________________¶
_____¶¶____¶¶________________¶_
______¶_____¶¶________________¶¶¶¶¶¶
_______¶_____¶¶_______________¶¶¶¶¶¶¶
______¶¶¶_____¶¶_____________¶¶¶¶¶¶¶¶
_____¶¶¶¶¶______¶¶__________¶¶¶¶¶¶¶¶
_____¶¶¶¶¶_______¶¶¶_______¶¶¶¶¶¶¶¶
____¶¶¶¶¶¶_________¶¶¶____¶¶¶¶¶¶¶¶¶
____¶¶¶¶¶__________¶¶¶¶__¶¶¶¶¶¶¶¶¶¶
____¶¶¶¶¶_________¶¶¶¶_¶¶¶¶¶¶¶¶¶¶¶¶
____¶¶¶¶¶¶______¶¶¶¶¶___¶¶¶¶¶¶¶¶¶¶¶
____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶___¶¶¶¶¶¶¶¶¶¶
_____¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶____¶¶¶¶¶¶¶¶¶¶
______¶¶¶¶¶¶¶¶¶¶¶¶¶____¶¶¶¶¶¶¶¶¶¶
_______¶¶¶¶¶¶¶¶¶¶¶______¶¶¶¶¶¶¶¶
"
end

def menu
  puts " - Song  : Pick a song based on your mood"
  puts " - Views : View playlist of songs you're Draking to"
  puts " - Exit  : Exit"
end

def mood
 puts "Please pick a following mood: "
## Maybe use a mood_id instead of mood

moods = ["Don't Drake and Drive", "Money Monday", "Hype Mode", "Feel Good", "Dance Party"]
# puts "Don't Drake and Drive", "Money Monday", "Hype Mode", "Feel Good", "Dance Party"
moods.each do |mood|
  puts mood
end

puts " "
puts " "


current_mood = gets.chomp
if moods.include?(current_mood)
puts "You've chosen #{current_mood}, here's a Drake song we recommend!"
@recommended_song = Song.find_by_moods(current_mood).sample
@user.update({:mood=> current_mood})
@song_info = { artist: "#{@recommended_song.artist}", song_name: "#{@recommended_song.song_name}", release_date: "#{@recommended_song.release_date}", on_itunes: "#{@recommended_song.on_itunes}"}

@song_info.each do |info, value|
  puts "#{info.upcase} : #{value}"
end
# puts "Artist : #{@recommended_song.artist}"
# puts "Song : #{@recommended_song.song_name}"
# puts "Album : #{@recommended_song.album_name}"
# puts "Release date : #{@recommended_song.release_date}"
# puts "Song available on itunes: #{@recommended_song.on_itunes}"
else
  puts "That is not a valid mood"
end
end




#   playlist = Playlist.new(song_info)


def save_song
  puts "Would you like to save this song to your playlist?(Y/N)"
   playlist_save = gets.chomp
     if playlist_save == 'Y'
     # song_info.each do |info, value| puts “#{info} : #{value}”
       playlist = Playlist.new(@song_info)
       playlist.update({:user_id => @user.id})
       playlist.update({:song_id => @recommended_song.id})
       playlist.save


       # binding.pry
     puts "Saved to Playlist!"
   else
     puts "Let's try another song!"
  end
end





    def your_playlist
    puts "Would you like to see the songs in your playlist?(Y/N)"
    show_playlist = gets.chomp
    if show_playlist == 'Y'
    puts "Here is your current Playlist:"
    Playlist.all.find_by(user_id: @user.id)
    end
  @our_playlist
else "Let try a different song"
end



  def exit_drake
    puts "If youre reading this, its too late."
  end


 def run
    greeting
    menu
    input = gets.chomp
    # case input
 if input == "Song"
    mood
    save_song
    # menu
  #   input = gets.chomp
  # elsif input == "Views"
    your_playlist
    menu
    input = gets.chomp
  elsif input == "Exit"
   exit_drake
 end
end
 run
