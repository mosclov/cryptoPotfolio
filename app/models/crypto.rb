class Crypto < ApplicationRecord
  before_save :downcase_fields
  before_save :remove_comma
  validates :name, presence: true
  validates :qty, presence: true

  def downcase_fields
    self.name.downcase! if self.name?
  end

  def remove_comma
    self.qty.to_s.delete(',').to_f if self.qty
  end

end
