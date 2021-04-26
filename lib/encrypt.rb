require 'time'
require './lib/enigma'
# require './lib/key'

enigma = Enigma.new
# key = Key.new

original_text = File.open(ARGV[0], "r")

incoming_text = original_text.read

original_text.close

encrypted_text = enigma.encrypt(incoming_text.chomp, ARGV[2], ARGV[3])

new_text = File.open(ARGV[1], "w")

new_text.write(encrypted_text[:encryption])

new_text.close

puts "#{ARGV[1]} was created on #{encrypted_text[:date]} with a key of #{encrypted_text[:key]}."
