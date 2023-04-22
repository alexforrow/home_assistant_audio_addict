require 'bundler/setup'
require 'audio_addict'
require 'erb'

AudioAddict::Radio.networks.each do |network, _name|
  radio = AudioAddict::Radio.new network

  template = ERB.new(File.read('script_template.yml.erb'))

  puts template.result_with_hash(
    network: network,
    network_name: radio.name,
    channels: radio.channels,
    host: radio.url_template.gsub(/\/[^\/]+$/, '')
    )
end
