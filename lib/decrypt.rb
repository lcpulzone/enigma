require 'time'
require './lib/enigma'

enigma = Enigma.new

encrypted_text = File.open(ARGV[0], "r")

incoming_text = encrypted_text.read

encrypted_text.close

decrypted_text = enigma.decrypt(incoming_text.chomp, ARGV[2], ARGV[3])

new_text = File.open(ARGV[1], "w")

new_text.write(decrypted_text[:decryption])

new_text.close

puts "#{ARGV[1]} was created on #{decrypted_text[:date]} with a key of #{decrypted_text[:key]}."
