#!/usr/bin/env ruby
puts ARGV[0].scan(/(?<=from:)\w+|\+?\d{1,3}?\d{10}|(?<=to:)\+?\d{1,3}?\d{10}|(?<=flags:)-?\d:-?\d:-?\d:-?\d:-?\d/).join(',')
