class Node
	attr_accessor :element, :other_node
	def initialize(element)
		@element = element
		@other_node = nil 
	end

	def insert_after(other_node)
		@other_node = other_node
	end

	def remove_after
		@other_node = nil 
	end
end
