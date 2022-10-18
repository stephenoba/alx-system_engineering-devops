#!/usr/bin/env ruby
puts ARGV[0].scan(/((\+\d{1,3}[ -])?\(?(\d{3})\)?[ -]?(\d{3})[ -]?(\d{4}))/).join
