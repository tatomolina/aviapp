class Plane < ApplicationRecord
  validates :manufacturer, presence: true
  validates :model, presence: true
  has_many :plane_registrations

  def full_name
    "#{self.manufacturer} #{self.model}"
  end

end
