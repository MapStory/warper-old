class MapstoryController < ApplicationController

	require 'oauth2'

	def index

	end

	def callback
		@token = "none"
		client = OAuth2::Client.new('c4c15df0710b16f01216', 'fb74460f583399db7d4337b2d2401c6fe9ba1f93', :site => 'http://mapstory.dev.opengeo.org', :token_url => '/oauth2/access_token/', :authorize_url => '/oauth2/authorize/') 

		if params[:code]
			@token = client.auth_code.get_token(params[:code], :redirect_uri => 'http://warper.mapstory.org/mapstory/callback')
		end

	end

	def authorize

		client = OAuth2::Client.new('c4c15df0710b16f01216', 'fb74460f583399db7d4337b2d2401c6fe9ba1f93', :site => 'http://mapstory.dev.opengeo.org', :token_url => '/oauth2/access_token/', :authorize_url => '/oauth2/authorize/') 
		@auth_url = client.auth_code.authorize_url(:redirect_uri => 'http://warper.mapstory.org/mapstory/callback')

	end


end