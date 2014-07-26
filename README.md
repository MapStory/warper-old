Map-Warper
===============

This is a clone of the NYPL map warper created by Tim Waters, with changes for use in Gaia GPS and MapStory

If you are interested in forking this project, I suggest you go with the original.

This project is currently in use at warper.mapstory.org


## Map Story Integration

### Login
A cookie set by mapstory.org is required to log on.

### User name Restrictions
User names must not contain colons or double quotes.

## Initial Setup

Create folder /db/maptileindex

Create symlink of public/mapimages to /data/mapimages

in /data/mapimages create:
	dst/
	dst/png
	src/