# frozen_string_literal: true

require 'spec_helper'

describe 'meetup::hex_ip' do
  # please note that these tests are examples only
  # you will need to replace the params and return value
  # with your expectations
  it { is_expected.to run.with_params('10.0.0.1').and_return('0A000001') }
  it { is_expected.to run.with_params('10.10.0.1').and_return('0A0A0001') }
  it { is_expected.to run.with_params(nil).and_raise_error(StandardError) }
end
