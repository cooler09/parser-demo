require 'parser'

describe Parser do
    before do
        @parser = Parser.new
    end

    describe ".parse" do
        context "error conditions" do
            it "only parses strings, not numbers" do
                expect{@parser.parse("3")}.to raise_error("Please enter a string to parse")
            end
        end

        context "without a specified separator" do
            it "separates by comma and returns an array of strings" do
                expect(@parser.parse("foo,bar")).to eql(["bar","foo"])
            end
        end

        context "when the separator is specified" do
            it "can use pipe as a separator" do
                expect(@parser.parse("pipe:foo|bar")).to be(["foo","bar"])
            end

            it "can use comma as an explicit separator" do
                expect(@parser.parse("pipe:foo,bar")).to eql(["foo","bar"])
            end
        end

        context "when the specified separator isn't in the string" do
            it "won't separate by the default separator" do
                expect(@parser.parse("pipe:foo,bar")).to eql(["foo","bar"])
            end

            it "returns just one element" do
                expect(@parser.parse("pipe:foo|bar")).to eql(["foo,bar"])
            end
        end

        context "with more than two elements" do
            it "returns them all as strings" do
                expect(@parser.parse("pipe:foo|bar|3")).to eql(["foo","bar",3])
            end
        end
    end
end