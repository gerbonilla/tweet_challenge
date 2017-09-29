class TweetsController < ApplicationController
  def index
    # destroy all tweets in db
    Tweet.destroy_all
    @tweets = $client.user_timeline(params[:username], {count: 200})
    # split words and remove any non-letters + spaces --> put these into array @words
    @words = @tweets.map { |tweet| tweet.text.downcase.split(/\W/).reject { |word| (word == "") } }.flatten
    @word_count = count_words(@words)
  end

  def show
  end

  def edit
  end

  def update
    @tweet = Tweet.find(params[:id])
    @letter = @tweet.content[0]
  end

  def destroy
  end

  private

  def count_words(words)
    # stop words used to remove from array
    stop_words = Stopword.all.map { |stopword| stopword.text }
    # reject words on stop_words file
    words = words.reject { |word| stop_words.include? word }
    word_count = {}
      words.each do |word|
        word_count[word].nil? ? word_count[word] = 1 : word_count[word] += 1
      end
    word_count = word_count.sort_by { | key, value | value }.reverse
    return word_count
  end
end
