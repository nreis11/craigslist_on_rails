require "securerandom"

class Article < ApplicationRecord
  belongs_to :category

  before_create :generate_edit_key

  validates :title, presence: true
  validates :body, presence: true
  validates :price, presence: true

  def generate_edit_key
   key = SecureRandom.hex(10)
   self.edit_key = key
  end

end
