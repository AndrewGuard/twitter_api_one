get '/' do
  # Look in app/views/index.erb
  erb :index
end

# get '/send_tweet' do
# puts "tweet"
#   Twitter.update("Tweeting from the command line")
#   erb :to_render
# end

get '/test' do
  @tweets = Twitter.home_timeline
  erb :view_tweets
end

get '/:username' do
  @user = Twitteruser.find_or_create_by_username(params[:username])
  p @user 
  if @user.tweets_stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)

  erb :view_tweets
end

post '/submit_tweet' do 
  @tweet = Twitter.update(params[:user_input])
  @tweets = Twitter.user_timeline
  @tweets << @tweet


  # @user.tweets.save 

  # if (@tweet.created_at + params[:tweet_delay].to_i) 


  # Tweet.delay_tweet(params[:user_input]), (params[:tweet_delay]))

  # Tweet.create(text: params[:user_input], created_at: Time.now + (params[:tweet_delay]))
 

  # if request.xhr? 
  erb :view_tweets
  # else
  #   puts "Error tweet!" 
  # end 
end

# if @future_tweet
#   Twitter.update()



