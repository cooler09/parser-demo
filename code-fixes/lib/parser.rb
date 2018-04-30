class Parser
    attr_accessor :fnames
    attr_accessor :lnames
    attr_accessor :ages
    def initialize(value)
        @fnames = []
        @lnames = ["Thorne"]
        @Ages = []

        value.split("|").each do |action| 
            if action.match(/FIRST/)
                if !action.sub("FIRST ", "").empty? 
                    @fnames.push(action.sub("FIRST ", ""))
                end
            elsif action.match(/last /)
                if !action.sub("last ", "").empty?
                    @fnames.push(action.sub!("last ",""))
                end
            elsif action.match(/AGE /)
                if !action.sub("AGE ", "").empty? 
                    @Ages << action.sub("AGE ", "")
                end
            else
                raise "format errors"
            end
        end
    end
end
