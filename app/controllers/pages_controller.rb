class PagesController < ActionController::Base
  def index
    require "rubygems"
    require "twitter"
    # @tweets = Tweet.all

    # Certain methods require authentication. To get your Twitter OAuth credentials,
    # register an app at http://dev.twitter.com/apps

    #client = Twitter::Streaming::Client.new do |config|
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = '390u60XsK2NT1HhFTBfa7g'
      config.consumer_secret =  '36PgMnKr8Ij0oF2KGNSeF53eLxKbrF1va1mJNL3Y'
      config.oauth_token = '565043575-jHvcgBllfPWFtb5zBcWJqu3B0tq1ghNkbKiAkP3E'
      config.oauth_token_secret = 'xIxKyk6SRWnGct4frB0tIKBuIKNQrb6VBLZT44aK3LuBO'
    end

    @arrayOfTweets = []
    # client.search("to:justinbieber marry me", :count => 3, :result_type => "recent").take(3).collect do |object|
    client.search("life", :count => 20, :result_type => "recent").take(20).collect do |object|
      @arrayOfTweets <<  object.text if object.is_a?(Twitter::Tweet)  
    end


    require "flickraw"

    FlickRaw.api_key="49be9cfc544528589df1dfa4d7878c6b"
    FlickRaw.shared_secret="737b50330524d349"

    @list  = flickr.photos.getRecent

    id     = @list[0].id
    secret = @list[0].secret
    info = flickr.photos.getInfo :photo_id => id, :secret => secret
    
    url=params[:url]
    @embed_photo={}
    @embed_photo['flickr']=FlickRaw.url(info)

    puts info.title           # => "PICT986"
    puts info.dates.taken     # => "2006-07-06 15:16:18"

    sizes = flickr.photos.getSizes :photo_id => id

    original = sizes.find {|s| s.label == 'Original' }
    #puts original.width       # => "800" -- may fail if they have no original marked image
  

    require "ruby_reddit_api"
    r = Reddit::Api.new "acontero", "lalala"
    @results = r.browse "funny"
    
  end
end