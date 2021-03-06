require 'time'
require './lib/enigma'

enigma = Enigma.new

original_text = File.open(ARGV[0], "r")

incoming_text = original_text.read

original_text.close

encrypted_text = enigma.encrypt(incoming_text.chomp)

new_text = File.open(ARGV[1], "w")

new_text.write(encrypted_text[:encryption])

new_text.close

puts "#{ARGV[1]} was created on #{encrypted_text[:date]} with a key of #{encrypted_text[:key]}."
