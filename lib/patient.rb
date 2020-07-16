class Patient
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def appointments
    Appointment.all.select { |appt| appt.patient == self }
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def doctors
    self.appointments.reduce([]) { |drs, appt| drs << appt.doctor }
  end
end