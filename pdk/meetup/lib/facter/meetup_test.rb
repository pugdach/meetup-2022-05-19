# frozen_string_literal: true

Facter.add(:meetup_test) do
  # https://puppet.com/docs/puppet/latest/fact_overview.html
  setcode do
    'hello facter'
  end
end
