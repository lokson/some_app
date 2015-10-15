require_relative 'app'

app = App.new()
puts 'the Toy Robot console'
puts 'type command and hit enter'
puts 'ctrl+c to exit'
while(true)
  puts app.exec(gets())
end
