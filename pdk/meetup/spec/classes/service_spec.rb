# frozen_string_literal: true

require 'spec_helper'

describe 'meetup::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it {
        is_expected.to compile

        is_expected.to contain_service('meetup')
          .with(
            'ensure' => 'running',
            'enable' => true,
          )
      }
    end
  end
end
