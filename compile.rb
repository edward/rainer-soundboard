require "erb"

sound_file_names = Dir.glob("sounds/*.{mp3, ogg}")

sound_ids = sound_file_names.map do |sound|
  sound.gsub("sounds/", '').gsub(/\..+$/, '').gsub(/\W/, '')
end

def button_id(sound_id)
  sound_id + "-button"
end

def sound_id(sound)
  sound.gsub("sounds/", '').gsub(/\..+$/, '').gsub(/\W/, '')
end

template = File.read("index.html.erb")
result = ERB.new(template).result

File.open("index.html", "w+") do |f|
  f << result
end

`open index.html`