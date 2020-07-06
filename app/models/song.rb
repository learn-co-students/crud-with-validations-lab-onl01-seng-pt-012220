class Song < ApplicationRecord
    validates :title, presence: true
    validates :release_year, presence: true, if: :has_been_released? 
    validates :released, uniqueness: { scope: :release_year, message: "should happen once per year" }
    validates :release_year, numericality: { less_than: Date.today.year }, allow_nil: true

    def has_been_released?
        released == true
    end
end

