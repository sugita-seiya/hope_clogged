require 'rails_helper'

describe Group do
  describe '#create' do
    it "nameが存在すれば登録できること" do
      group = build(:group)
      expect(group).to be_valid
    end

    it "nameが空では登録できないこと" do
      report = build(:report,name: nil)
      report.valid?
      expect(report.errors[:name]).to include("can't be blank")
    end
  end
end


