FactoryBot.create(
  :admin_user,
  email: 'admin@example.com',
  password: 'Password1',
  password_confirmation: 'Password1')

puts '✅ | Admin User created:'
puts '🔑 | email:    admin@example.com'
puts '🔑 | password: Password1'
puts '🔥 | -'
puts
