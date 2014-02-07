#clock.rb
require 'clockwork'
include Clockwork

handler do |job|
  puts "Running #{job}"
end

every(5.seconds, 'frequent.job')
