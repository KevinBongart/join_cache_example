task join: :environment do
  Assembly.find_each do |assembly|
    p assembly.parts.order(:part_number)
  end
end

task join_cache: :environment do
  Assembly.find_each do |assembly|
    p assembly.cached_parts.order(:part_number)
  end
end
