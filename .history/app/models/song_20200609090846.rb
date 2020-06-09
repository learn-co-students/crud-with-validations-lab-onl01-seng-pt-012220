class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: {in: %w(True False)}
end
