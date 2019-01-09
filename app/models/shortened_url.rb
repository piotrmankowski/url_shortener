# frozen_string_literal: true

class ShortenedUrl < ApplicationRecord
  validates :original_url, presence: true, url: true
  validates :sanitized_url, presence: true, url: true

  def key
    Base62.encode self.id
  end
end
