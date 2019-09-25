class JungleBeat
    attr_reader :list

    def initialize
        @list = LinkedList.new
    end

    def append(string)
        nodes = string.split(" ")
        nodes.each do |node|
            @list.append(node)
        end
    end

    def play
        puts `say -v Victoria #{@list.to_string}`
    end
end