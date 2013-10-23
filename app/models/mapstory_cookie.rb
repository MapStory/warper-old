# Provides methods for handling the mapstory cookie.
class MapstoryCookie

# Pass in the contents of the cookie to verify and decode.
# returns the username if success, false otherwise.
def self.decode(data)
	Rails.logger.info "Cookie Decode: Not doing anything at the moment."

	data
end


end