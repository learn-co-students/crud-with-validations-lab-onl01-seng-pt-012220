class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: {in: [true,false]}
    validates :artist_name, presence: true
    validate :year_released_check
    def year_released_check
        if self.released
            current_year = Time.now.year
            if !self.release_year
                errors.add(:release_year, "must exist")
            elsif self.release_year > current_year 
                errors.add(:release_year, "cannot have been released in the future")
            elsif Song.find_by(:artist_name => self.artist_name, :title => self.title, :release_year => self.release_year)
                errors.add(:release_year, "already exists")
            end            
        end
    end
end
