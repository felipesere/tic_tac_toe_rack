require 'web_io'
RSpec.describe WebDisplay::WebIO do
 let(:web_io) { described_class.new }

 it 'not ready without a move' do
   expect(web_io.ready?).to be false
 end

 it 'becomes ready when a move is set' do
   web_io.set_next_move 2
   expect(web_io.ready?).to be true
 end

 it 'is not longer ready once the move has been read' do
   web_io.set_next_move 2
   expect(web_io.read).to be 2
   expect(web_io.ready?).to be false
 end
end
