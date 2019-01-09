# frozen_string_literal: true

module ShortenedUrls
  class Creator
    KEY_LENGTH = 3

    attr_reader :original_url

    def initialize(params)
      @original_url = params[:original_url]
    end

    def call
      return existed_shortened_url if existed_shortened_url

      ShortenedUrl.new(original_url: stripped_original_url, sanitized_url: sanitized_original_url, key: uniq_key)
    end

    private

    def existed_shortened_url
      @existed_shortened_url ||= ShortenedUrl.find_by(original_url: original_url)
    end

    def sanitized_original_url
      return '' unless stripped_original_url.present?

      sanitized_url = stripped_original_url
      (sanitized_url.include? 'http') ? sanitized_url : 'http://' + sanitized_url
    end

    def stripped_original_url
      @stripped_original_url ||= original_url.strip
    end

    def uniq_key
      key = SecureRandom.hex(KEY_LENGTH)
      ShortenedUrl.exists?(key: key) ? uniq_key : key
    end
  end
end
