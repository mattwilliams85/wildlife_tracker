require 'rails_helper'

describe Location do
  it { should validate_presence_of :name}
end
