require 'rubygems'
require_relative 'git_changes'

dir = '/Users/evizitei/Code/instructure/canvas-lms'
Dir.chdir dir
shas =`git log --oneline --since='4 weeks ago' | cut -f 1 -d ' '`

file_lists = shas.split(/\n/).map do |sha|
  `git diff --name-only #{sha} #{sha}~1`
end

problems = file_lists.select{|list| GitChanges.is_a_problem?(list) }

puts "FOUND #{problems.count} problems"
File.open("problems.txt", 'w') do |f|
  problems.each{|p| f << p << "\n"}
end

