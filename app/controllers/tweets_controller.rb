class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
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

    # a = []
    # topics = ["coffee", "tea"]
    # client.filter(:track => topics.join(",")) do |object|
    #   #puts object.text if object.is_a?(Twitter::Tweet)
    #   a <<  object.text if object.is_a?(Twitter::Tweet)
    # end

    @arrayOfTweets = []
    client.search("to:justinbieber marry me", :count => 3, :result_type => "recent").take(3).collect do |object|
      @arrayOfTweets <<  object.text if object.is_a?(Twitter::Tweet)  
    end

    # search = Twitter::REST::API::Search
    # search("new year resolution", :count => 3) do |t| 
    #   puts t.text
    # end

  
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new

  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tweet }
      else
        format.html { render action: 'new' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
  end

  # def user_tweet
  #   require "rubygems"
  #   require "twitter"
  
  #      Twitter.configure do |config|
  #     config.consumer_key = '390u60XsK2NT1HhFTBfa7g'
  #     config.consumer_secret =  '36PgMnKr8Ij0oF2KGNSeF53eLxKbrF1va1mJNL3Y'
  #     config.oauth_token = '565043575-FgBm7atBozOcxaZoW2s8NcnSnQwZ7w57bVilH8Aq'
  #     config.oauth_token_secret = 'Vjj2zhVNI8oTYtbxfw4FqMZFd2JHdMNGCzGN8Be7GvU45'
  #   end
  
  #   # Initialize your Twitter client
  #   client = Twitter::Client.new
  
  #   # Post a status update
  #   client.update("I just posted a status update via the Twitter Ruby Gem !")
  #   redirect_to request.referer, :notice => 'Tweet successfully posted'

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:tweet_content)
    end
  
end
