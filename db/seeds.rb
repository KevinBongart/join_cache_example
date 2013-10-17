LIMIT = 10000

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

ActiveRecord::Base.transaction do
  LIMIT.times do |i|
    Assembly.create(name: "Assembly #{i}")
    Part.create(part_number: i)
    Physician.create(name: "Physician #{i}")
    Patient.create(name: "Patient #{i}")
  end
end

ActiveRecord::Base.transaction do
  (LIMIT * 100).times do |i|
    AssembliesParts.create(
      assembly_id: rand(1..LIMIT),
      part_id:   rand(1..LIMIT)
    )
  end
end

ActiveRecord::Base.transaction do
  (LIMIT * 100).times do |i|
    Appointment.create(
      physician_id: rand(1..LIMIT),
      patient_id:   rand(1..LIMIT)
    )
  end
end
