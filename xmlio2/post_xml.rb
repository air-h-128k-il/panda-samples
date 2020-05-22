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

body = <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<xmlio2>
  <body type="record">
    <c1 type="string">c1</c1>
    <i1 type="int">1</i1>
    <n1 type="number">3.14159265</n1>
    <b1 type="bool">TRUE</b1>
    <a1 type="array">
      <a1_child type="int">0</a1_child>
      <a1_child type="int">1</a1_child>
      <a1_child type="int">2</a1_child>
    </a1>
    <r1 type="array">
      <!-- 0 -->
      <r1_child type="record">
        <r1c1 type="string">ra1c1 1</r1c1>
        <r2 type="repord">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">ra1c1 2</r1c1>
        <r2 type="repord">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">ra1c1 3</r1c1>
        <r2 type="repord">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
    </r1>
  </body>
</xmlio2>
EOF

req = Net::HTTP::Post.new("/test1/test1")
req.content_type = "application/xml"
req.body = body
req.content_length = body.size
req.basic_auth("sample", "sample")

Net::HTTP.start("localhost", 8000) {|http|
  res = http.request(req)
  puts res.code
  puts res.body
}
