require 'jumpstart_auth'
require 'bitly'
require 'klout'

class MicroBlogger
	attr_reader :client

	def initialize
		puts 'Initializing MicroBlogger'
		@client = JumpstartAuth.twitter
		Klout.api_key = 'xu9ztgnacmjx3bu82warbr3h'
	end

	def tweet(message)
   		if message.size <= 140
   			@client.update(message)
   		else
   			puts "Tweet is too long, cut it back!"
   		end
	end

	def run
		puts "Welcome to the JSL Twitter Client"
		command = ""
		while command != "q"
			printf "Enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts.shift
			case command
				when 'q' then puts "Goodbye!"
				when 't' then tweet(parts.join(" "))
				when 'dm' then dm(parts[0], parts[1..-1].join(" "))
				when 'spam' then spam_my_followers(parts[1..-1].join(" "))
				when 'elt' then everyones_last_tweet
				when 's' then shorten
				when 'turl' then tweet(parts[0..-2].join(" ") + " " + shorten(parts[-1]))
				else
					puts "Sorry, I don't know how to #{command}"
			end
		end
	end

	def dm(target, message)
		screen_names = @client.followers.collect { |follower| @client.screen_name }
		if screen_names.include?(target)
			puts "Trying to send #{target} this direct message:"
			puts message
			message = "d @#{target} #{message}"
			tweet(message)
		else
			puts "You can only DM people who follow you"
		end
	end

	def followers_list
		screen_names = []
		@client.followers.each { |follower| screen_names << @client.user(follower).screen_name}
		screen_names
	end

	def spam_my_followers(message)
		followers_list.each {|follower| dm(follower, message)}
	end

	def everyones_last_tweet
		friends = @client.friends
		friends.each do |friend|
			timestamp = friend.status.created_at
			puts "#{friend.screen_name} (#{time.strftime("%A, %b %d")}): #{friend.status.text}"
			puts "\n"
		end
	end

	def shorten(url)
		bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
        puts "Shortening this URL: #{url}"
        bitly.shorten(url).short_url
	end

	def klout_score
		screen_names = @client.friends.collect{ |f| f.screen_name }
		screen_names.each do |friend|
			identity = Klout::identity.find_by_screen_name('friend')
			user = Klout::User.new(identity.id)
			puts "#{friend}: #{user.score.score}\n"
		end
	end
end

blogger = MicroBlogger.new
blogger.run
blogger.klout_score
