module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods 
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @csv_headers = split_line(file.gets)
            file.each do |line|
                @csv_contents << split_line(line)
            end
        end

        def each_row(&block)
            @csv_contents.each do |x|
                yield CsvRow.new(@csv_headers, x)
            end
        end

        def split_line(line)
            line.chomp.split(', ')    
        end 
    end

    attr_accessor :csv_headers, :csv_contents

    def initialize
        read
    end
end

class CsvRow
    def initialize(names, values)
        @names = names
        @values = values
    end  

    def method_missing(meth, *args, &block)
        i = @names.index(meth.to_s.strip)
        @values[i]
    end  

    attr_reader :names, :values
end

class RubyCsv 
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
puts m.csv_headers.inspect
puts m.csv_contents.inspect

m.each_row do |row| 
    puts "#{row.singular} -> #{row.plural}" 
end

