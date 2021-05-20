class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]

  def index
    @tweets = Tweet.order(created_at: :desc).limit(10)
  end

  def show
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_url, notice: "Tweet was successfully created." }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(Tweet.new, partial: "tweets/form", locals: {tweet: Tweet.new}) }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@tweet, partial: "tweets/form", locals: {tweet: @tweet}) }
      end
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweets_url, notice: "Tweet was successfully updated." }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(Tweet.new, partial: "tweets/form", locals: {tweet: Tweet.new}) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@tweet, partial: "tweets/form", locals: {tweet: @tweet}) }
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
