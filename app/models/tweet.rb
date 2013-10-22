class Tweet < ActiveRecord::Base
  belongs_to :twitteruser

  # def self.delay_tweet(user_input, delay_time)
  #   @future_tweet = self.create(text: params[:user_input], created_at: (Time.now + delay_time))
  # end 


end
