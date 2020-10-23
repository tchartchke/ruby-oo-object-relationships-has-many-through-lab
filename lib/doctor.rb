class Doctor
  attr_accessor :name
  @@all = []

  def self.all 
    @@all
  end

  def initialize(name)
    self.name = name
    self.class.all << self
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

  def appointments
    Appointment.all.select {|appt| appt.doctor == self}
  end

  def patients
    self.appointments.map {|appt| appt.patient }.uniq
  end
  
end