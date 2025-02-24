require 'bundler/setup'
require 'audio_addict'
require 'erb'

all_channels = {}

def artwork_url(images)
    # 224 wide is right for 1920 resolution with 8 across
    "https:#{images['default'].split('{').first}?size=224x224"
  end

AudioAddict::Radio.networks.each do |network, network_name|
  radio = AudioAddict::Radio.new network

  radio.channels.each do |key, obj|
    all_channels[obj.listen_urls.first] = {
      network: network_name, #.sub('Digitally Imported', 'DI.FM'),
      name: obj.name,
      artwork: artwork_url(obj.images)
    }
  end
end

template = ERB.new(File.read('macro_template.yml.erb'), trim_mode: '-')

puts template.result_with_hash(
  channels: all_channels
)
