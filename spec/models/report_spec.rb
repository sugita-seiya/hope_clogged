require 'rails_helper'

describe Report do
  describe '#create' do
    it "text,dateが存在すれば登録できること" do
      report = build(:report)
      expect(report).to be_valid
    end

    it "textが空では登録できないこと" do
      report = build(:report,text: nil)
      report.valid?
      expect(report.errors[:text]).to include("can't be blank")
    end

    it "dateが空では登録できないこと" do
      report = build(:report,date: nil)
      report.valid?
      expect(report.errors[:date]).to include("can't be blank")
    end
  end
end