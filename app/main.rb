require_relative "../console.rb"

print "Enter a state (AB) to view congressional delegation: "
input = gets.chomp.upcase

state_id = State.find_by(name: input).id
sen_title_id = Title.find_by(name: "Sen").id
rep_title_id = Title.find_by(name: "Rep").id
puts "Senators from #{input}:"
Politician.where(state_id: state_id, title_id: sen_title_id).order(:lastname).each do |pol|
  puts "  #{pol.firstname} #{pol.lastname} (#{Party.find(pol.party_id).name})"
end
puts "Representatives from #{input}:"
Politician.where(state_id: state_id, title_id: rep_title_id).order(:lastname).each do |pol|
  puts "  #{pol.firstname} #{pol.lastname} (#{Party.find(pol.party_id).name})"
end

print "Enter a gender to analyze (M or F): "
input = gets.chomp.upcase

Politician.where(gender: input).count