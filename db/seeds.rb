require 'faker'
require 'benchmark'

ApplicationRecord.transaction do
  Dir[Rails.root.join('db/seeds/*.seeds.rb')].each do |file|
    include FactoryBot::Syntax::Methods

    puts "\n🤖 | - Seeding: #{file}"
    measurement = Benchmark.measure do
      require file
    end

    puts "🔧 | Time spent on this file: #{measurement.real}\n"
  end
end