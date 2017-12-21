class Prospect < ApplicationRecord
  validates :name, presence: true

  before_save :downcase_fields

  def downcase_fields
    self.name.downcase! if self.name?
  end
end
