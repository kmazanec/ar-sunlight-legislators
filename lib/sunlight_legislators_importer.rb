require 'csv'
require_relative "../console.rb"

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      row.each do |field, value|
        new_pol = Politician.new
        if field == "title"
          new_pol.title = Title.find_or_create_by(name: value)
        elsif field == "state"
          new_pol.state = State.find_or_create_by(name: value)
        elsif field == "party"
          new_pol.party = Party.find_or_create_by(name: value)
        else
          new_pol.send("#{field}=", value)
        end
        new_pol.save
      end
    end
  end
end

SunlightLegislatorsImporter.import("../db/data/legislators.csv")

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
