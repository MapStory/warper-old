# edit this file to contain credentials for the OAuth services you support.
# each entry needs a corresponding token model.
#
# eg. :twitter => TwitterToken, :hour_feed => HourFeedToken etc.
#
OAUTH_CREDENTIALS={
#   :twitter=>{
#     :key=>"",
#     :secret=>""
#   },
#   :google=>{
#     :key=>"",
#     :secret=>"",
#     :scope=>"" # see http://code.google.com/apis/gdata/faq.html#AuthScopes
#   },
#   :agree2=>{
#     :key=>"",
#     :secret=>""
#   },
#   :fireeagle=>{
#     :key=>"",
#     :secret=>""
#   },
#   :hour_feed=>{
#     :key=>"",
#     :secret=>"",
#     :options=>{ # OAuth::Consumer options
#       :site=>"http://hourfeed.com" # Remember to add a site for a generic OAuth site
#     }
#   },
# this gem lacks oauth2 consumer support, these values do not make sense for
# oauth 2.0.
    :mapstory=>{
      :key=>"c4c15df0710b16f01216",
      :secret=>"fb74460f583399db7d4337b2d2401c6fe9ba1f93",
      :options=>{
        :site=>"http://mapstory.dev.opengeo.org",
        :token_url=>"/oauth2/access_token/",
        :authorize_url=>"/oauth2/authorize/",
     #   :request_token_path=>"/oauth2/access_token/",
     #   :access_token_path=>"/oauth2/2/access_token/",
     #   :authorize_path=>"/oauth2/authorize/",
     #   :http_method=>:post
      }
    },
#   :nu_bux=>{
#     :key=>"",
#     :secret=>"",
#     :super_class=>"OpenTransactToken",  # if a OAuth service follows a particular standard 
#                                         # with a token implementation you can set the superclass
#                                         # to use
#     :options=>{ # OAuth::Consumer options
#       :site=>"http://nubux.heroku.com" 
#     }
#   }
}
# 
OAUTH_CREDENTIALS={
} unless defined? OAUTH_CREDENTIALS

load 'oauth/models/consumers/service_loader.rb'
