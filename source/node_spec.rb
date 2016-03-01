require_relative 'node'

RSpec.describe Node do
	let(:greeting) {Node.new("hello")}
	let(:farewell) {Node.new("goodbye")}

	describe 'the Node class' do
		it 'holds and element' do
			expect(greeting.element).to eq "hello"
		end

		it 'has can insert the node after' do
			greeting.insert_after(farewell)
			expect(greeting.other_node.element).to eq "goodbye"
		end

		it 'can remove the node after' do
			greeting.insert_after(farewell)
			greeting.remove_after
			expect(greeting.other_node).to eq nil
		end
	end
end
