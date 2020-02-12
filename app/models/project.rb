class Project < ApplicationRecord
  has_and_belongs_to_many :personas
    validates :name , presence: {message: "content is empty"}
end
