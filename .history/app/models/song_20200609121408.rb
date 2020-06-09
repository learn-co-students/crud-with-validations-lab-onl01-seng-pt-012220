class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: {in: [true,false]}
    validates :artist_name, presence: true
    validate :artist_title_year_check, on: :create
    validate :year_released_check
    def year_released_check
        if self.released
            current_year = Time.now.year
            if !self.release_year
                errors.add(:release_year, "must exist")
            elsif self.release_year > current_year 
                errors.add(:release_year, "cannot have been released in the future")
            end            
        end
    end
    def artist_title_year_check
        artists_songs_during_this_songs_year = []
        Song.all.each do |song|
            if song.artist_name == self.artist_name && song.release_year == self.release_year
                artists_songs_during_this_songs_year << song.title
            end
        end
        if artists_songs_during_this_songs_year.include?(self.title)
            errors.add(:title, "this song exists")
        end
    end
end
