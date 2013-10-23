# Provides methods for handling the mapstory cookie.
class MapstoryCookie

	# Pass in the contents of the cookie to verify and decode.
	# returns the username if success, false otherwise.
	def self.decode(data)
		# Remove the quotes from the cookie string, then split.
		name, hash = data.gsub('"',"").split(":")
		hash_check = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha1'), MAPSTORY_COOKIE_KEY, name)
		return name if hash_check == hash  	# Hash verifies, return user name.
		false																# Hash didn't verify, return false
	end


end