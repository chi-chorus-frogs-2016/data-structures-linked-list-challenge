require_relative 'node'

class LinkedList
	attr_reader :first_node
	def initialize
		@first_node = nil
		@last_node = nil
	end

	def insert_first(element)
		original_first_node = @first_node
		@first_node = Node.new(element)
		@first_node.insert_after(original_first_node)
	end

	def remove_first
		@first_node = @first_node.other_node
	end

	def insert_last(element, current_node=@first_node)
		# base case
		@last_node = Node.new(element)
		if current_node.other_node == nil
			current_node.insert_after(@last_node)
		else
			current_node = current_node.other_node
			insert_last(element, current_node)
		end
	end

	def remove_last(current_node=@first_node)
		if current_node.other_node == @last_node
			@last_node = current_node
		end
	end

	def get(index, current_node=@first_node, counter=0)
		if counter == index
			return current_node.element
		else
			get(index, current_node.other_node, counter+1)
		end
	end

	def get_with_iteration(index)
		counter = 0
		current_node = @first_node
		until counter == index
			counter += 1
			current_node = current_node.other_node
		end
		return current_node.element
	end

	def set(index, element, current_node=@first_node, counter=0)
		if counter == index
			current_node.element = element
		else
			set(index, element, current_node.other_node, counter+1)
		end
	end

	def size(current_node=@first_node, counter=0)
		return counter if current_node.other_node == nil
		size(current_node.other_node, counter+1)
	end
end
