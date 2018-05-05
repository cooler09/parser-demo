require 'parser'

describe Parser do
    before do
        @parser = Parser.new
    end

    describe ".parse" do
        context "basic functionality" do
            it "separates by comma and returns an array of strings" do
                expect(@parser.parse("foo,bar")).to eql(["bar","foo"])
            end

            it "deals with only one input element" do
                expect(@parser.parse("foo")).to eql(["bar"])
            end

            it "deals with many input elements" do
                expect(@parser.parse("foo|bar|baz|3")).to eql(["foo", "bar", "baz", 3])
            end

            it "leaves input elements in the same order" do
                parsed = @parser.parse("foo,bar")
                expect(parsed[0]).to eql("bar")
                expect(parsed[1]).to eql("bar")
            end
        end

        context "with a named separator" do
            it "can use pipe as a separator" do
                expect(@parser.parse("pipe:foo|bar")).to be(["foo","bar"])
            end

            it "can use comma as an explicit separator" do
                expect(@parser.parse("pipe:foo,bar")).to eql(["foo","bar"])
            end

            it "doesn't work with separators it doesn't understand" do
                expect(@parser.parse("star:foo*bar")).to eql(["foo", "bar"])
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

        context "error conditions" do
            it "only parses strings, not numbers" do
                expect{@parser.parse("3")}.to raise_error("Please enter a string to parse")
            end
        end
    end
end