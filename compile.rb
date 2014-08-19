require "erb"

sound_file_names = Dir.glob("sounds/*.{mp3, ogg}")
template = File.read("index.html.erb")

herp = "yep"

result = ERB.new(template).result

File.open("index.html", "w+") do |f|
  f << result
end

`open index.html`