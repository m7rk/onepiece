require 'marky_markov'
markov = MarkyMarkov::TemporaryDictionary.new
Dir["eps/*"].each do |d|
     markov.parse_file d
     puts "parsed #{d}"
end

puts markov.generate_n_words 1000