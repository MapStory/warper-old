namespace :admin do

	desc "Grant super admin rights to username"
	task :grant => :environment do
		puts "Provide a MapStory username that will"
		puts "have full admin privileges granted"
		puts "case sensitive"
		name = STDIN.gets

		# The following roles must already exist in the system:
		# Role.create(:name => "super user")
		# Role.create(:name => "administrator")
		# Role.create(:name => "editor")

		user = User.find_by_login(name)

		if user.nil?
			puts "Unable to find user. Perhaps they haven't logged in yet?"
			break
		end

		su = Role.find_by_name("super user")
		admin = Role.find_by_name("administrator")
		editor = Role.find_by_name("editor")

		Permission.create(:role => su, :user => user)
		Permission.create(:role => admin, :user => user)
		Permission.create(:role => editor, :user => user)

		puts "#{user.login} has been granted super user, administrator, and editor rights"

	end

end