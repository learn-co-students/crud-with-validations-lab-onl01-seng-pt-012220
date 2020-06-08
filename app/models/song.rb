class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :artist_name,
    message: "Title cannot be the same within the year" }
    validates :release_year, numericality: { allow_nil: true, less_than_or_equal_to: Date.today.year }
    validates :release_year, presence: true, if: :released?
    validates :artist_name, presence: true

    def released?
        self.released == true
    end

end
