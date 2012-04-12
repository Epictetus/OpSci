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

  # arr = ["Cell Metabolism", "http://www.cell.com/cell-metabolism/home"]
  if arr[1][0..19] == 'http://www.cell.com/'
    abb = arr[1].split('/')[3]
    temp = {
      "url"   => "#{arr[1]}",
      "rss"   => "http://www.cell.com/rssFeed/#{abb}/rss.NewIssueAndArticles.xml",
      "index" => "http://www.cell.com/#{abb}/archive"
    }

  # arr = ["Cognitive Sciences", "http://www.cell.com/trends/cognitive-sciences/home"]
  elsif  arr[1][0..26] == 'http://www.cell.com/trends/'
    abb = arr[1].split('/')[4]
    temp = {
      "url"   => "#{arr[1]}",
      "rss"   => "http://www.cell.com/rssFeed/#{abb}/rss.NewIssueAndArticles.xml",
      "index" => "http://www.cell.com/#{abb}/archive"
    }
    
  else
    puts "BLEEP! BLOOP! I dont know how to build this entry: #{arr}"
  end

  full_array = { "name" => arr[0], "url" => temp['url'], "rss" => temp['rss'], "index" => temp['index'] }
#  p full_array
  return full_array
end










def main()  
  page = Mechanize.new.get 'http://www.cell.com/cellpress'
  # both of these are journals
  # FIXME: How to append / push to a nodeset
  journals = page.search('#changeJournaljournals').search('li').search('a')
  trends = page.search('#changeJournaltrends').search('li').search('a')

  topics_list = []
  for journal in journals
#    p journal.text()
#    p journal.attributes["href"].text()
    link = "http://www.cell.com#{journal.attributes["href"].text()}"
    name = journal.text()
#    p [name, link]
    topics_list << [name, link]
  end
  for trend in trends
#    p journal.text()
#    p journal.attributes["href"].text()
    link = "http://www.cell.com#{trend.attributes["href"].text()}"
    name = trend.text()
#    p [name, link]
    topics_list << [name, link]
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










