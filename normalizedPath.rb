path = ARGV[0]
normalizedPath = []
if not path.nil?  
  path.split("/", -1).each do |folder|
    folder = folder.chomp
    if folder == ".."
      normalizedPath.pop()
    elsif folder != "."
      normalizedPath.push(folder)
    end
  end
end
puts normalizedPath.join("/")