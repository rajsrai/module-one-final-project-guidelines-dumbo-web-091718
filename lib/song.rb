class Song < ActiveRecord::Base
belongs_to :playlist

  def self.find_by_moods(mood)
    self.all.select do |songs|
      songs.mood == mood
    end
    # Song.where(mood: mood)
  end
  # def self.no_mood(mood)
  #   self.all.select do |songs|
  #     songs.mood != mood
  #   end
  # end

  # def song_by_name
  #   self.map do |songs|
  #     songs.name
  #   end
  # end

end
