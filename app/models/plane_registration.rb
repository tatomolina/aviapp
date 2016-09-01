class PlaneRegistration < ApplicationRecord
  validates :prefix, presence: true
  validates :suffix, presence: true
  validates :year, presence: true
  validates :power, presence: true
  validates :plane_class, presence: true

  belongs_to :plane
  belongs_to :plane_class

  def registration
    "#{self.prefix}-#{self.suffix}"
  end

end
