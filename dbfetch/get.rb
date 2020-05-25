#!/usr/bin/ruby

require 'pp'
require 'uri'
require 'net/http'

=begin
arg1=0 limit 100(default)
arg1=1 limit 1
arg1=2 limit 49
arg1=3 limit 0
=end

limit = ARGV[0].to_i
req = Net::HTTP::Get.new("/test1/test1?arg1=#{limit}")
req.basic_auth("sample", "sample")

Net::HTTP.start("localhost", 8000) {|http|
  res = http.request(req)
  puts res.code
  puts res.body
}
