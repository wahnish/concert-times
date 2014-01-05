require 'sinatra'
require 'nokogiri'
require 'open-uri'

get '/' do 
	# defines the url - where we get our data from
	url = "http://www.930.com/concerts/"
	# brings the data down
	data = Nokogiri::HTML(open(url))

# data.at_css('.headliners.summary').text
# data.at_css('.dates').text.strip
# data.at_css('.times').text.strip

# price options
# .ticket-price
# data.at_css('.price-range').text.strip
# data.at_css('.sold-out').text
# sold out with parking option
# data.at_css('.custom').text

# all concert listings
# data.css('.list-view-item')

# separates data into individual concerts
# Assign to variable so we can play with it
# add @ to turn into instance variable so 
# we can access it outside the block
	@concerts = data.css('.list-view-item')
# when done, render the view :shows
	erb :shows

end

# concerts.class
# => Nokogiri::XML::NodeSet

# check for ':each' or 'each_with_index' so that we can loop through it
# concerts.methods.sort

# >> concerts[18].at_css('.sold-out').nil?
# => false
# >> concerts[1].at_css('.sold-out').nil?
# => true

#concerts.each do |concert|
	# name of the show
	#puts concert.at_css('.headliners.summary').text

	# date of the show
	#puts concert.at_css('.dates').text

	# time of the show
	#puts concert.at_css('.times').text

	# sold or price
	# if .sold-out is not nil, it is sold out.
	#if !concert.at_css('.sold-out, .custom').nil?
	#	puts "SOLD OUT"
	#else
	#	puts concert.at_css('.price-range').text
	#end

	# empty
	#puts ""

#end