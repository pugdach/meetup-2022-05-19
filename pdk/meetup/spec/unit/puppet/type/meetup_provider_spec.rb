# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/meetup_provider'

RSpec.describe 'the meetup_provider type' do
  it 'loads' do
    expect(Puppet::Type.type(:meetup_provider)).not_to be_nil
  end
end
