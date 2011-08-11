# Note 1: This scrapes github's search page because I couldn't find a 
# way to do it using the API. So if the markup changes on that page,
# this is not likely to work!

require './languages'
require 'net/http'

string_of_interest = 'wtf'
normalization_string = 'a' # see Note 2 below
search_strings = [string_of_interest, normalization_string]
languages = Languages::Popular + Languages::EverythingElse # see Note 3 below
stats = {}

languages.each do |lang| 
  stats[lang] ||= {}
  search_strings.each do |search_string|
    uri = URI.parse(URI.escape("https://github.com/search?type=Code&language=#{lang}&q=#{search_string}"))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    stats[lang][search_string] = response.body.scan(/Code \((.+)\)/).flatten[0].to_i
  end
end 

puts "Report as of: #{Time.now}\n"
puts "Raw Data:"
puts stats.inspect 
puts

puts "Language\tAbsolute WTFs\tEstimated # Repos\tWTFs per repository"
languages.each do |lang|
  absolute_wtfs = stats[lang][string_of_interest]
  estimated_num_repos = stats[lang][normalization_string]
  wtfs_per_repo = absolute_wtfs.to_f / stats[lang][normalization_string].to_f
  puts "#{lang}\t#{absolute_wtfs}\t#{estimated_num_repos}\t#{wtfs_per_repo}"
end
  
# Note 2: 
# Since I don't know how to find the number of repositories by language, 
# I figure 'a' is generic enough to give us close to the true number of 
# repos, in an effort to normalize the wtfs.
#
# Note 3:
# You could also use either Languages::Popular or Languages::EverythingElse.
# The split is how github had it on the language select form element on 
# their search page as of late July 2011. Beware that including 
# Languages::EverythingElse takes a long while!