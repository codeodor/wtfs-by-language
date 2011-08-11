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
end if false

stats = {"ActionScript"=>{"wtf"=>75, "a"=>77848}, "C"=>{"wtf"=>62385, "a"=>9072304}, "C#"=>{"wtf"=>3231, "a"=>2438095}, "C++"=>{"wtf"=>215631, "a"=>53301792}, "Common Lisp"=>{"wtf"=>123, "a"=>75713}, "CSS"=>{"wtf"=>882, "a"=>1316776}, "Diff"=>{"wtf"=>221, "a"=>154380}, "Emacs Lisp"=>{"wtf"=>87, "a"=>37207}, "Erlang"=>{"wtf"=>1129, "a"=>298617}, "Haskell"=>{"wtf"=>190, "a"=>112715}, "HTML"=>{"wtf"=>3875, "a"=>8040642}, "Java"=>{"wtf"=>8697, "a"=>5908772}, "JavaScript"=>{"wtf"=>6915, "a"=>4139248}, "Lua"=>{"wtf"=>1402, "a"=>146678}, "Objective-C"=>{"wtf"=>5998, "a"=>588443}, "Perl"=>{"wtf"=>2712, "a"=>899142}, "PHP"=>{"wtf"=>6718, "a"=>7244039}, "Python"=>{"wtf"=>9710, "a"=>2893533}, "Ruby"=>{"wtf"=>12624, "a"=>7710160}, "Scala"=>{"wtf"=>1059, "a"=>396717}, "Scheme"=>{"wtf"=>698, "a"=>378300}, "TeX"=>{"wtf"=>426, "a"=>168200}, "XML"=>{"wtf"=>1721, "a"=>2161596}, "Ada"=>{"wtf"=>0, "a"=>21266}, "AppleScript"=>{"wtf"=>0, "a"=>1967}, "Arc"=>{"wtf"=>0, "a"=>3104}, "ASP"=>{"wtf"=>2, "a"=>43719}, "Assembly"=>{"wtf"=>14, "a"=>18748}, "Batchfile"=>{"wtf"=>48, "a"=>46633}, "Befunge"=>{"wtf"=>0, "a"=>0}, "BlitzMax"=>{"wtf"=>0, "a"=>683}, "Boo"=>{"wtf"=>0, "a"=>4608}, "Brainfuck"=>{"wtf"=>1, "a"=>392}, "C-ObjDump"=>{"wtf"=>0, "a"=>0}, "ChucK"=>{"wtf"=>0, "a"=>35}, "Clojure"=>{"wtf"=>177, "a"=>96369}, "CMake"=>{"wtf"=>21, "a"=>3391}, "CoffeeScript"=>{"wtf"=>86, "a"=>39772}, "ColdFusion"=>{"wtf"=>48, "a"=>55601}, "Cpp-ObjDump"=>{"wtf"=>0, "a"=>0}, "Cucumber"=>{"wtf"=>35, "a"=>132475}, "Cython"=>{"wtf"=>2, "a"=>4277}, "D"=>{"wtf"=>65, "a"=>85389}, "D-ObjDump"=>{"wtf"=>0, "a"=>0}, "Darcs Patch"=>{"wtf"=>1, "a"=>1482}, "Delphi"=>{"wtf"=>17, "a"=>27357}, "Dylan"=>{"wtf"=>22, "a"=>17647}, "Eiffel"=>{"wtf"=>1, "a"=>26697}, "F#"=>{"wtf"=>109, "a"=>80679}, "Factor"=>{"wtf"=>2, "a"=>2536}, "Fancy"=>{"wtf"=>0, "a"=>216}, "FORTRAN"=>{"wtf"=>11, "a"=>35727}, "GAS"=>{"wtf"=>8, "a"=>195846}, "Genshi"=>{"wtf"=>0, "a"=>425}, "Gentoo Ebuild"=>{"wtf"=>25, "a"=>29730}, "Gentoo Eclass"=>{"wtf"=>14, "a"=>484}, "Go"=>{"wtf"=>77, "a"=>50657}, "Groff"=>{"wtf"=>1, "a"=>25253}, "Groovy"=>{"wtf"=>48, "a"=>79124}, "Haml"=>{"wtf"=>136, "a"=>156958}, "HaXe"=>{"wtf"=>72, "a"=>14076}, "HTML+Django"=>{"wtf"=>215631, "a"=>53100724}, "HTML+ERB"=>{"wtf"=>215631, "a"=>53534835}, "HTML+PHP"=>{"wtf"=>215631, "a"=>53776967}, "INI"=>{"wtf"=>259, "a"=>252465}, "Io"=>{"wtf"=>1, "a"=>2898}, "IRC log"=>{"wtf"=>3, "a"=>30}, "Java Server Pages"=>{"wtf"=>13, "a"=>74402}, "LilyPond"=>{"wtf"=>0, "a"=>553}, "Literate Haskell"=>{"wtf"=>11, "a"=>5499}, "LLVM"=>{"wtf"=>20, "a"=>34650}, "Makefile"=>{"wtf"=>45, "a"=>64132}, "Mako"=>{"wtf"=>0, "a"=>4}, "Markdown"=>{"wtf"=>523, "a"=>198600}, "Matlab"=>{"wtf"=>6, "a"=>3789}, "Max/MSP"=>{"wtf"=>0, "a"=>1}, "Mirah"=>{"wtf"=>12624, "a"=>7710162}, "Moocode"=>{"wtf"=>0, "a"=>38}, "mupad"=>{"wtf"=>0, "a"=>393}, "Myghty"=>{"wtf"=>0, "a"=>28}, "Nemerle"=>{"wtf"=>2, "a"=>298}, "Nimrod"=>{"wtf"=>3, "a"=>354}, "Nu"=>{"wtf"=>0, "a"=>118}, "NumPy"=>{"wtf"=>0, "a"=>0}, "ObjDump"=>{"wtf"=>0, "a"=>0}, "Objective-J"=>{"wtf"=>28, "a"=>70442}, "OCaml"=>{"wtf"=>109, "a"=>80679}, "ooc"=>{"wtf"=>699, "a"=>7738}, "OpenCL"=>{"wtf"=>0, "a"=>597}, "Parrot Internal Representation"=>{"wtf"=>0, "a"=>844}, "Prolog"=>{"wtf"=>13, "a"=>2345}, "Pure Data"=>{"wtf"=>1, "a"=>9618}, "R"=>{"wtf"=>26, "a"=>26497}, "Racket"=>{"wtf"=>34, "a"=>26016}, "Raw token data"=>{"wtf"=>1, "a"=>7868}, "Rebol"=>{"wtf"=>0, "a"=>110}, "Redcode"=>{"wtf"=>0, "a"=>18}, "reStructuredText"=>{"wtf"=>300, "a"=>169417}, "RHTML"=>{"wtf"=>34, "a"=>116599}, "Rust"=>{"wtf"=>7, "a"=>3112}, "Sass"=>{"wtf"=>21, "a"=>56298}, "Self"=>{"wtf"=>0, "a"=>175}, "Shell"=>{"wtf"=>666, "a"=>569032}, "Smalltalk"=>{"wtf"=>8, "a"=>14896}, "Smarty"=>{"wtf"=>73, "a"=>252455}, "Standard ML"=>{"wtf"=>0, "a"=>673}, "SuperCollider"=>{"wtf"=>16, "a"=>7796}, "Tcl"=>{"wtf"=>4, "a"=>35525}, "Tcsh"=>{"wtf"=>0, "a"=>1725}, "Text"=>{"wtf"=>2035, "a"=>1869690}, "Textile"=>{"wtf"=>495, "a"=>122566}, "Vala"=>{"wtf"=>9, "a"=>6891}, "Verilog"=>{"wtf"=>23, "a"=>20028}, "VHDL"=>{"wtf"=>0, "a"=>6978}, "VimL"=>{"wtf"=>483, "a"=>235945}, "Visual Basic"=>{"wtf"=>40, "a"=>13210}, "XQuery"=>{"wtf"=>0, "a"=>1096}, "XS"=>{"wtf"=>4, "a"=>439}, "YAML"=>{"wtf"=>201, "a"=>572139}}

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