ActiveRecord::Base.transaction do
  1000.times do |i|
    Assembly.create(name: "Assembly #{i}")
    Part.create(part_number: "#{i}")
    Physician.create(name: "Physician #{i}")
    Patient.create(name: "Patient #{i}")
  end
end

Part.find_each do |part|
  part.assemblies = Assembly.all.sample(rand(100..1000))
end

Patient.find_each do |patient|
  patient.physicians = Physician.all.sample(rand(100..1000))
end
