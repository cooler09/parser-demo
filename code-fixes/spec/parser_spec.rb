require 'parser'

describe Parser do
    describe "fnames array" do
        context "given string 'FIRST Steve'" do
            it "should add 'Steve' to fnames array" do
                parser = Parser.new("FIRST Steve")
                expect(parser.fnames).to be_include("Steve")
            end
        end
        context "given the string 'FIRST '" do
            it "should not add anything to fnames array" do
                parser = Parser.new("FIRST ")
                expect(parser.fnames.length).to be 0
            end
        end
        context "given string 'first Steve'" do
            it "should raise 'format error'" do
                expect{Parser.new("first Steve")}.to raise_error("format error")
            end
        end
        context "given the string 'FIRSTSteve'" do
            it "should raise 'format error'" do
                expect{Parser.new("FIRSTSteve")}.to raise_error("format error")
            end
        end
    end
    describe "lnames array" do
        context "given the string 'LAST Thorne'" do
            it "should add 'Thorne' to lnames array" do
                parser = Parser.new("LAST Thorne")
                expect(parser.lnames).to be_include("Thorne")
            end
        end
        context "given the string 'LAST '" do
            it "should not add anything to lnames array" do
                parser = Parser.new("LAST ")
                expect(parser.lnames.length).to be 0
            end
        end
        context "given string 'last Thorne'" do
            it "should raise 'format error'" do
                expect{Parser.new("last Thorne")}.to raise_error("format error")
            end
        end
        context "given the string 'LASTThorne'" do
            it "should raise 'format error'" do
                expect{Parser.new("LASTThorne")}.to raise_error("format error")
            end
        end
    end
    describe "ages array" do
        context "given the string 'AGE 55'" do
            it "should add '55' to ages array" do
                parser = Parser.new("AGE 55")
                expect(parser.ages).to be_include("55")
            end
        end
        context "given the string 'AGE '" do
            it "should not add anything to ages array" do
                parser = Parser.new("AGE ")
                expect(parser.ages.length).to be 0
            end
        end
        context "given the string 'AGE55'" do
            it "should raise 'format error'" do
                expect{Parser.new("AGE55")}.to raise_error("format error")
            end
        end
        context "given string 'age 55'" do
            it "should raise 'format error'" do
                expect{Parser.new("age 55")}.to raise_error("format error")
            end
        end
    end
    context "given the string 'MIDDLE Adam'" do
        it "should raise 'format error'" do
            expect{Parser.new("MIDDLE Adam")}.to raise_error("format error")
        end
    end



end