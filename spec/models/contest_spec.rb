require 'rails_helper'

RSpec.describe Contest, type: :model do

  describe "Contest validations" do 
    it 'should have a name' do 
      contest = FactoryGirl.build_stubbed(:contest, name: '')
      expect(contest).to be_invalid
    end

    it "should have criteria" do 
      contest = FactoryGirl.build_stubbed(:contest, criteria: '')
      expect(contest).to be_invalid
    end

    it "should default to true" do 
      contest = FactoryGirl.build_stubbed(:contest)
      expect(contest.active).to eq true
    end 


  end# Ends Contest Validations


end # Ends RSpec.decribe
