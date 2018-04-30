require 'parser'

describe Parser do
    before do
        @parser = Parser.new
    end
    describe ".parse" do
        context "given the number 3" do
            it "should raise error" do
                expect{@parser.parse(3)}.to raise_error("Please enter a string to parse")
#                expect{@parser.parse("3")}.to raise_error("Please enter a string to parse")
            end
        end
        context "given the value 'foo,bar'" do
            it "should return ['foo','bar']" do
                expect(@parser.parse("foo,bar")).to eql(['foo','bar'])
                #expect(@parser.parse("foo,bar")).to eql(['bar','foo'])
            end
        end
        context "given the string 'pipe:foo|bar'" do
            it "should return ['foo','bar']" do
                expect(@parser.parse("pipe:foo|bar")).to eql(['foo','bar'])
            end
    end
end