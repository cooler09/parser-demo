class Parser

    def parse(value)
        if !value.is_a? String
            raise "Please enter a string to parse"
        end
        if value.match(/pipe:/)
            value.split("|")
        else
            value.split(",")
        end
    end
end