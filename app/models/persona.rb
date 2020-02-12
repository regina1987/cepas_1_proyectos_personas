class Persona < ApplicationRecord
  has_and_belongs_to_many :projects
validates :name , presence: {message: "content is empty"}
end
