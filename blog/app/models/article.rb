class Article < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy

    # add validations for title and body
    # presence means the value must contain at least one non-whitespace char
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
