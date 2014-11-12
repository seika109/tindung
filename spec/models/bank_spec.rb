require 'rails_helper'

describe Bank do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe "associations" do

  end
end
