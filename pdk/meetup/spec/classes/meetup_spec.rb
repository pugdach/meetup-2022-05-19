# frozen_string_literal: true

require 'spec_helper'

describe 'meetup' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it {
        is_expected.to compile

        is_expected.to contain_file('/etc/meetup')
          .with(
            'ensure'  => 'file',
            'content' => 'Hello world',
            'owner'   => 'root',
            'group'   => 'root',
            'mode'    => '0640',
          )
          .that_notifies('Service[meetup]')

        is_expected.to contain_class('meetup::service')
      }
    end
  end
end
