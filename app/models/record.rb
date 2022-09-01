class Record < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :category_records, dependent: :destroy
  has_many :category_records, dependent: :destroy
end
