class User < ActiveRecord::Base
has_many :playlist
has_many :song

 # def self.song_by_mood(mood)
 #   Song.all.select do |songs|
 #     songs.mood == mood
 #   end
 # end
#
#
#  def show_playlist
#    Playlist.all.select do |playlists|
#      playlists.user == self
#    end
#  end
#
#  def save_song_to_playlist
#     Playlist.all.find do |playlists|
#       playlists.user_id == self
#     end
#  end
#
#
end
