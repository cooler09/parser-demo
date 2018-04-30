require_relative 'parser'

parser = Parser.new("FIRST Josh|FIRST Steve|FIRST Frank|FIRST Jim|FIRST Bill|LAST Ramsey|LAST Smith|LAST Thorne|AGE 30|AGE 55|AGE 21|AGE 90")
puts parser.fnames
puts parser.lnames
puts parser.ages