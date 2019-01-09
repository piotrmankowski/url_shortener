# frozen_string_literal: true

class ShortenedUrlsController < ApplicationController
  def new
    @shortened_url = ShortenedUrl.new
  end

  def create
    @shortened_url = ShortenedUrls::Creator.new(shortened_url_permitted_params).call

    if @shortened_url.save
      redirect_to @shortened_url
    else
      render :new
    end
  end

  def show
    @shortened_url = ShortenedUrl.find(params[:id])
  end

  def redirect
    decoded_id =   Base62.decode params[:key]
    shortened_url = ShortenedUrl.find(decoded_id)
    redirect_to shortened_url.sanitized_url
  end

  private

  def shortened_url_permitted_params
    params.fetch(:shortened_url, {}).permit(:original_url)
  end
end
