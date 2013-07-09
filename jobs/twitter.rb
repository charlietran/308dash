require 'twitter'

#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
Twitter.configure do |config|
  config.consumer_key = 'uPlkCqbVuFp3YgD71ouA'
  config.consumer_secret = '59RxJAzbJ5sAsJv6fcxbL9DM4PAmzL0M9LOQOT5ZpHE'
  config.oauth_token = '17665662-cKaafNPzsbMwAXiu3t7lnB7sGWsVf0j3aGdGyLEcY'
  config.oauth_token_secret = 'XV6XgYx2Ro8H2bAOUsaEOwwb2o0AtxIMb6rog6AkQbo'
end

search_term = URI::encode('from:DUMBOFoodTrucks')

SCHEDULER.every '10m', :first_in => 0 do |job|
  begin
    tweets = Twitter.search("#{search_term}").results

    if tweets
      tweets.map! do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end