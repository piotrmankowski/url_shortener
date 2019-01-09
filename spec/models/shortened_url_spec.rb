# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenedUrl do
  describe 'columns' do
    it { is_expected.to have_db_column(:original_url).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:sanitized_url).of_type(:text).with_options(null: false) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:original_url) }
    it { is_expected.to validate_presence_of(:sanitized_url) }
  end
end
