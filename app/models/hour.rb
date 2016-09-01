class Hour < ApplicationRecord
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :plane_registration_id, presence: true
  validates :purpose_flight_id, presence: true
  validates :landings, presence: true
  validates :user_id, presence: true

belongs_to :user
belongs_to :purpose_flight
belongs_to :plane_registration

def time_of_flight
  @timeOfFlight = get_time_of_flight
  @mof = @timeOfFlight.last * 60 # mof == minutes of flight

  @timeOfFlight[1] = self.get_minutes(@mof)
  @timeOfFlight.inject(0) {|sum, x| sum + x}
end

def get_time_of_flight
  ((self.end_time - self.start_time) / 3600).divmod 1 # with "divmod 1" I divide the number integer for one part float for the other
end

def get_minutes(mof)
  if mof >= 0 && mof < 3
    0.0
  elsif mof >= 3 && mof < 9
    0.1
  elsif
  mof >= 9 && mof < 15
    0.2
  elsif
  mof >= 15 && mof < 21
    0.3
  elsif
  mof >= 21 && mof < 27
    0.4
  elsif
  mof >= 27 && mof < 34
    0.5
  elsif
  mof >= 34 && mof < 40
    0.6
  elsif
  mof >= 40 && mof < 46
    0.7
  elsif
  mof >= 46 && mof < 52
    0.8
  elsif
  mof >= 52 && mof < 58
    0.9
  elsif
  mof >= 58 && mof < 60
    1.0
  end
end

end
