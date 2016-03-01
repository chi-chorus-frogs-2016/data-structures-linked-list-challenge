require_relative 'linked_list'

describe LinkedList do
	let(:greeting) {Node.new("hello")}
	let(:middle) {Node.new("middle")}
	let(:farewell) {Node.new("goodbye")}
	let(:link_list) {LinkedList.new}

	it 'inserts a first element' do
		link_list.insert_first("greeting")
		expect(link_list.first_node.element).to eq("greeting")
	end

	it 'removes the first node if only one exists' do
		link_list.insert_first("greeting")
		link_list.remove_first
		expect(link_list.first_node).to eq(nil)
	end

	it 'removes the first node and the next node is now first' do
		link_list.insert_first("first")
		link_list.insert_last("second")
		link_list.remove_first
		expect(link_list.first_node.element).to eq("second")
	end

	it 'inserts the last node at the end' do
		link_list.insert_first("first")
		link_list.insert_last("second")
		link_list.insert_last("third")
		expect(link_list.first_node.other_node.other_node.element).to eq("third")
	end

	it 'removes the last node, and the second last node is now @last_node' do
		link_list.insert_first("first")
		link_list.insert_last("second")
		link_list.insert_last("third")
		link_list.remove_last
		expect(link_list.first_node.other_node.element).to eq("second")
	end

	it 'returns the element at index with recursion' do
		link_list.insert_first("first")
		link_list.insert_last("second")
		link_list.insert_last("third")
		link_list.insert_last("fourth")
		link_list.insert_last("fifth")
		expect(link_list.get(3)).to eq("fourth")
	end

	it 'returns the element at index with iteration' do
		link_list.insert_first("first")
		link_list.insert_last("second")
		link_list.insert_last("third")
		link_list.insert_last("fourth")
		link_list.insert_last("fifth")
		expect(link_list.get_with_iteration(3)).to eq("fourth")
	end

	it 'sets and element at an idex' do
		link_list.insert_first("first")
		link_list.insert_last("second")
		link_list.insert_last("third")
		link_list.insert_last("fourth")
		link_list.insert_last("fifth")
		link_list.set(3,"FUCKYOU")
		expect(link_list.get(3)).to eq("FUCKYOU")
	end


end
