class GitChanges
  def self.is_a_problem?(files)
    GitChanges.new(files).is_a_problem?
  end

  attr_reader :files
  def initialize(file_string)
    @files = file_string.gsub("lib/feature.rb",'')
  end

  def is_a_problem?
    !!((files =~ /^(app|public).*\.(coffee|js)$/ &&
      !(files =~ /^spec.*\.(coffee|js)$/)) ||
    (files =~ /^(app|lib).*\.rb$/ &&
      !(files =~ /^spec.*\.rb$/) ))
  end

end
