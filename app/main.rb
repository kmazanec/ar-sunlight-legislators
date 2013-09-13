require_relative "../console.rb"

print "Enter a state (AB) to view congressional delegation: "
input = gets.chomp


state_id = State.find_by(name: input).id
Politician.where(state_id: state_id).each do |pol|
  puts "#{Title.find(pol.title_id).name} #{pol.firstname} #{pol.lastname} (#{Party.find(pol.party_id).name})\n"
end