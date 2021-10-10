class Article < ApplicationRecord
    has_many :comments

    # add validations for title and body
    # presence means the value must contain at least one non-whitespace char
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
