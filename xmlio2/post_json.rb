#!/usr/bin/ruby

require 'pp'
require 'uri'
require 'net/http'

Net::HTTP.version_1_2

=begin
xml2 {
    context		int;
    object		object;
	mode		int;
    recordname	varchar(128);

	body {
		c1		char(128);
		i1		int;
		n1		number(15,10);
		b1		bool;
		a1		int[3];
 		r1 {
			r1c1		char(128);
			r2 {
				r2c1	char(128);
			};
		}[3];
	};
};
=end
        #"r1i1":[1,2,3,4,5,6],

body = <<EOF
{
  "body":{
    "c1":"c1",
    "i1":13234,
    "n1":3.14,
    "b1":true,
    "a1":[0,0,2],
    "r1":[
      {
        "r1i1":[1,2,3,4,5,6],
        "r1c1":"r1c1 0",
        "r2":{
          "r2c1":""
        }
      },
      {
        "r2":{
          "r2c1":""
        }
      },
      {
        "r2":{
          "r2c1":""
        }
      }
    ]
  }
}
EOF

#body = <<EOF
#{
#}
#EOF

req = Net::HTTP::Post.new("/test1/test1")
req.content_type = "application/json"
req.body = body
req.content_length = body.size
req.basic_auth("sample", "sample")

Net::HTTP.start("localhost", 8000) {|http|
  res = http.request(req)
  puts res.code
  puts res.body
}
