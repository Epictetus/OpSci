require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'json'
require './skraper_addons.rb'

__FILE__ == $0 ? ( REPO_NAME = __FILE__.split(".")[0] ) : ""

class String
  include JsonMethods
end


def build_json(arr)
  full_array = []

  # arr = ["http://www.biomedcentral.com/bmcblooddisord/", "BMC Blood Disorders"]
  if  arr[1][0..28] == 'http://www.biomedcentral.com/' # BMC-internal journals
    abb = arr[1].split('/')[3]
    @temp = {
      "url"   => "#{arr[1]}",
      "rss"   => "http://www.biomedcentral.com/#{abb}/latest/rss",
      "index" => "http://www.biomedcentral.com/#{abb}/archive"
    }

  # arr = ["http://www.biotechnologyforbiofuels.com", "Biotechnology for Biofuels"]
  elsif arr[1][0..6] == 'http://' 
    @temp = {
      "url"   => "#{arr[1]}",
      "rss"   => "#{arr[1]}/latest/rss",
      "index" => "#{arr[1]}/archive"
    }
  else
    puts "BLEEP! BLOOP! I dont know how to build this entry: #{arr}"
  end

  full_array = { "name" => arr[0], "url" => @temp['url'], "rss" => @temp['rss'], "index" => @temp['index'] }
  return full_array
end







def main()  
  page = Mechanize.new.get('http://www.biomedcentral.com/journals')
#  journals = page.search('#leftDiv').xpath('/ul').count
  journals = page.search('h3')
  p journals.count

  topics_list = []
  for journal in journals 
#    puts journal.search('a').count
    link = journal.search('a')[0].attributes["href"].text()
    link[-1] == '/' ? ( link = link.chop ) : "" # ensure all URLS end without "/"
    name = journal.search('a')[0].text()
    p [link, name]
    name != "" ? (topics_list << [name,link]) : ""
  end

  final = []
  for t in topics_list
#    build_json(t)
    journal_entry = verify_data(build_json(t))
    final << journal_entry
  end

  puts "VALID JSON? #{final.to_json.valid_json?}"
  output_file = "#{REPO_NAME}_output.json"

  puts "Writing output to file: #{output_file}"
  File.open(output_file,'a').write(final.to_json)

  puts "VERIFYING... All outputs should be quiet"
  for entry in final
    verify_data(entry, false)
  end

end



main()










