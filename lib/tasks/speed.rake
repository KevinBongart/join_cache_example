task has_and_belongs_to_many: :environment do
  Assembly.find_each do |assembly|
    assembly.parts.map
  end
end

task has_and_belongs_to_many_with_join_cache: :environment do
  Assembly.find_each do |assembly|
    assembly.cached_parts.map
  end
end

task has_many_through: :environment do
  Physician.find_each do |physician|
    physician.patients.map
  end
end

task has_many_through_with_join_cache: :environment do
  Physician.find_each do |physician|
    physician.cached_patients.map
  end
end

task speed_test: :environment do
  require 'rake_performance'

  Rake::Task["has_and_belongs_to_many"].invoke
  Rake::Task["has_and_belongs_to_many_with_join_cache"].invoke
  Rake::Task["has_many_through"].invoke
  Rake::Task["has_many_through_with_join_cache"].invoke
end
