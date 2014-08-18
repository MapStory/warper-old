namespace :debug do

	desc "Create a signed cookie, for testing - Interactive"
	task :make_cookie => :environment do
		puts "Provide a MapStory username that will be signed"
		puts "case sensitive"
		name = STDIN.gets.strip

		hash_check = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha1'), MAPSTORY_COOKIE_KEY, name)

		puts "#{name}:#{hash_check}"
		puts "Copyable code:"
		puts "cookies[:msid] = \"#{name}:#{hash_check}\""
	end

	desc "Ensure records match proper enforcement rules"
	task :sanitize_maps => :environment do
		# Loop through all maps that don't have a description set, and set it to something.
		maps = Map.all

		maps.each do |m|
			toggle = false

			if m.description.blank?
				m.description = "description goes here"
				toggle = true
			end

			if m.tag_list.empty?
				m.tag_list.add("Map")
				toggle = true
			end

			if toggle
				m.save
				puts "Map updated"
			end

		end
	end




end