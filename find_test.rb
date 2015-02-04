require 'find'
require 'pathname'

total_size = 0
realpath = Pathname.new(File.dirname(__FILE__)).realpath #Pathname.new(__FILE__).realpath
Find.find(realpath) do |path|
  if FileTest.directory?(path)
    if File.basename(path)[0] == ?.
      Find.prune       # Don't look any further into this directory.
    else
      next
    end
  else
    #p path
    total_size += FileTest.size(path)
  end
end

p total_size
