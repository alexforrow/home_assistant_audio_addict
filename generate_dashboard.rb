require 'bundler/setup'
require 'audio_addict'
require 'erb'

$template = ERB.new(File.read('picture_entity.yml.erb'))

def artwork_url(images)
  # 224 wide is right for 1920 resolution with 8 across
  "https:#{images['default'].split('{').first}?size=224x224"
end

def write_channel(network, channel_key)
  radio = AudioAddict::Radio.new network
  channel = radio[channel_key]
  raise "Unknown channel #{channel_key} on #{network.to_s}" if channel.nil?

  puts $template.result_with_hash(
    target: 'media_player.study',
    url: channel.listen_urls.first,
    artwork: artwork_url(channel.images)
    )
end

write_channel(:zenradio, 'perfectsunsets')
write_channel(:di, 'minimal')
write_channel(:jazzradio, 'modernbigband')
write_channel(:classicalradio, 'solopiano')
write_channel(:jazzradio, 'blues')
write_channel(:di, 'trance')
write_channel(:classicalradio, 'symphonies')
write_channel(:di, 'chillntropicalhouse')
write_channel(:rockradio, '00srock')
write_channel(:rockradio, 'softrock')
write_channel(:di, 'edm')
write_channel(:di, 'lounge')


