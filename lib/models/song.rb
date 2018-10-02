class Song < ActiveRecord::Base
belongs_to :playlist
def self.song_by_mood(mood)
  self.all.select do |songs|
    songs.mood == mood
  end
end

end
