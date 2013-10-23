# Provides methods for handling the mapstory cookie.
class MapstoryCookie

	# Pass in the contents of the cookie to verify and decode.
	# returns the username if success, false otherwise.
	def self.decode(data)
		MAPSTORY_COOKIE_KEY

		name, hash = data.split(":")



		Rails.logger.info "Cookie Decode: Not doing anything at the moment."
		Rails.logger.info "Name is: #{name}"
		Rails.logger.info "Hash is: #{hash}"

		hash_check = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha1'), MAPSTORY_COOKIE_KEY, name)

		Rails.logger.info "Our generated hash is: #{hash_check}"

		if hash_check == hash
			Rails.logger.info "Hash verifies"
		else
			Rails.logger.info "Unable to verify hash!!!!"
		end

		data
	end


end