class LinkedList
    attr_reader :head, :count

    def initialize
        @head = nil
        @count = 0
    end

    def append(data)
        @count += 1
        node = Node.new(data)
        if !@head
            @head = node
        else
            current_node = @head
            until current_node.next_node.nil?
                current_node = current_node.next_node
            end
            current_node.next_node = node
        end
    end

    def prepend(data)
        @count += 1
        node = Node.new(data)
        node.next_node = @head
        @head = node
    end

    def insert(position, data)
        @count += 1
        current_node = @head
        node = Node.new(data)
        (position - 1).times do
            current_node = current_node.next_node
        end
        node.next_node = current_node.next_node
        current_node.next_node = node
    end

    def find(position, amount)
        current_node = @head
        position.times do
            current_node = current_node.next_node
        end
        string = ""
        amount.times do
            string = string + current_node.data + " "
            current_node = current_node.next_node
        end
        string.chomp(" ")
    end

    def includes?(data)
        array = to_string.split(" ")
        array.any? {|word| word == data}
    end

    def pop
        current_node = @head
            until current_node.next_node.next_node.nil?
                current_node = current_node.next_node
            end
            current_node.next_node = nil
    end

    def to_string
        blurb = ""
        if @head
            current_node = @head
            until current_node.nil?
                blurb = blurb + current_node.data + " "
                current_node = current_node.next_node
            end
        end
        blurb.chomp(" ")
    end

end