# MapStory Login Cookie

The cookie, named "msid", must be set at the mapstory.org domain. This cookie must be present
and must contain the name of the user.

The name is not encrypted, but does have an HMAC digest created, to ensure it hasn't been tampered with. This
digest requires proper signing and un-signing via the MAPSTORY_COOKIE_KEY set in initializers. 

## Data example

Cookie msid -> "DavidLee:25dc4825241b1242f00cb69de25952c62a8f314f"

## Expiry times

The cookie must be refreshed as desired on MapStory.org. Any time this cookie is present, the user
is able to log on to warper.
