class Job < ApplicationRecord
  belongs_to :company
  has_many :applicaitons
end
