require 'parser'

describe Parser do
    describe ".initialize" do
        context "given the string '~fOo'" do
            it "should add 'FoO' to the final_data array" do
                parser = Parser.new("~fOo")
                expect(parser.final_data).to be_include("FoO")
            end
        end
        
        context "given the string '~FOo'" do
            it "should add 'foO' to the final_data array" do
                parser = Parser.new("~FOo")
                expect(parser.final_data).to be_include("foO")
            end
        end
        context "given the string '>FOO'" do
            it "should add 'foo' to the final_data array" do
                parser = Parser.new(">FOO")
                expect(parser.final_data).to be_include("foo")
            end
        end
        context "given the string '>FOOBAR'" do
            it "should add 'foobar' to the final_data array" do
                parser = Parser.new(">FOOBAR")
                expect(parser.final_data).to be_include("foobar")
            end
        end
        context "given the string '<foo'" do
            it "should add 'FOO' to the final_data array" do
                parser = Parser.new("<foo")
                expect(parser.final_data).to be_include("FOO")
            end
        end
        context "given the string '<foobar'" do
            it "should add 'FOOBAR' to the final_data array" do
                parser = Parser.new("<foobar")
                expect(parser.final_data).to be_include("FOOBAR")
            end
        end
        context "given the string '-foo'" do
            it "should add 'f' to the final_data array" do
                parser = Parser.new("-foo")
                expect(parser.final_data).to be_include("f")
            end
        end
        context "given the string '-foobar'" do
            it "should add 'f' to the final_data array" do
                parser = Parser.new("-foobar")
                expect(parser.final_data).to be_include("f")
            end
        end
        context "given the string '-foobar|<foobar|~fOo|>FOOBAR'" do
            it "should add 'f','FOOBAR','FoO','foobar' to the final_data array" do
                parser = Parser.new("-foobar|<foobar|~fOo|>FOOBAR")
                expect(parser.final_data).to eql(['f','FOOBAR','FoO','foobar'])
            end
        end
        context "given the string '~fOo|-foobar|>fOOBAR|<foobar'" do
            it "should add 'FoO','f','FOOBAR','foobar' to the final_data array" do
                parser = Parser.new("~fOo|-foobar|>fOOBAR|<foobar")
                expect(parser.final_data).to eql(['FoO','f','foobar','FOOBAR'])
            end
        end
    end
    describe "Error handling" do
        context "given the string '+foo'" do
            it "should raise 'format error'" do
                expect{Parser.new("+foo")}.to raise_error("format error")
            end
        end
        context "given the string '*foobar'" do
            it "should raise 'format error'" do
                expect{Parser.new("*foobar")}.to raise_error("format error")
            end
        end
        context "given the string '*foobar'" do
            it "should raise 'format error'" do
                expect{Parser.new("*foobar")}.to raise_error("format error")
            end
        end
    end
end