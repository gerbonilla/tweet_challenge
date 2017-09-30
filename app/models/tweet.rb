class Tweet < ApplicationRecord

  def self.count_words
    word_count = {}
    words = Tweet.all.map { |tweet| tweet.content }
    words.each do |word|
      word_count[word].nil? ? word_count[word] = 1 : word_count[word] += 1
    end
    word_count = word_count.sort_by { | key, value | value }.reverse
    return word_count
  end
end
