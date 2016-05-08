#Ethereum uses a nonstandard version of SHA3, and this gem is nonstandard
require 'digest/sha3'

if ARGV.empty?
  puts "Usage: ruby crack.rb [target hash] [difficulty]"
  puts "Example: ruby crack.rb [0x2d6324...] [0x2be5d2...]"
  
else
argv = ARGF.argv
leader = argv[0].to_i(16)
difficulty = argv[1].to_i(16)


#Seed with random data
winner = rand()

#SHA3 hash (it's actually keccak) and change to integer
challenge = Digest::SHA3.hexdigest(winner.to_s,256).to_i(16)

#Search for a collision that is less than the target difficulty to win
while ((challenge ^ leader) > difficulty) do
  winner = rand()
  challenge = Digest::SHA3.digest(winner.to_s,256).to_i(16)
end

#We escaped the loop, print the string.
puts "Submit this string to the 'Overthrow' function, quick!: #{winner}"

#If this took a long time, be sure to submit it quickly before a competitor changes the target hash on you!

end
