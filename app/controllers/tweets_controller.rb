class TweetsController < ApplicationController
  def index
    # destroy all tweets in db
    Tweet.destroy_all
    @words = fetch_words
  end

  def update
    @tweet = Tweet.find(params[:id])
    @letter = @tweet.content[0]
    Tweet.all.each do |tweet|
      tweet.destroy unless tweet.content[0] == @letter
    end
  end

  private

  def fetch_words
    tweets = $client.user_timeline(params[:username], {count: 200})
    words = tweets.map { |tweet| tweet.text.downcase.split(/\W/).reject { |word| (word == "") } }.flatten
    # stop words used to remove from array
    stop_words = Stopword.all.map { |stopword| stopword.text }
    # reject words on stop_words file
    words = words.reject { |word| stop_words.include? word }
    words.each {|word| Tweet.create(content: word)}
    return words
  end
end
