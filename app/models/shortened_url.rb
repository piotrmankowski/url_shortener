# frozen_string_literal: true

class ShortenedUrl < ApplicationRecord
  validates :original_url, presence: true, url: true
  validates :sanitized_url, presence: true, url: true
  validates :key, presence: true
end
