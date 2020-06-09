class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: {in: [true,false]}
    validates :artist_name, presence: true
    validate :release_year
    def release_year
        if self.released
            current_year = Time.now.year
            binding.pry
        end
    end
end
