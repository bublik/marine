require "spec_helper"

describe Notifications do
  describe "access_link" do
    let(:mail) { Notifications.access_link }

    it "renders the headers" do
      mail.subject.should eq("Access link")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
