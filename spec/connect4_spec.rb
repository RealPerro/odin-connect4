require_relative '../lib/connect4'



describe Connect4 do
  let(:game) {Connect4.new()}
  #create board
  context 'game created' do
    xit 'the board is an array' do
      expect(game.board).to be_an(Array)
    end

    xit 'the board has 7 columns' do
      expect(game.board.length).to eq(7)
    end
  end

  context 'play token' do
    xit 'p1 plays' do
      expect {game.play(1,1)}.to change {game.board[1][0]}.to(1)
    end

    xit 'p2 plays same' do
      expect {game.play(1,1); game.play(1,2)}.to change {game.board[1][1]}.to(2)
    end

    xit 'p2 plays different' do
      expect {game.play(1,1); game.play(3,2)}.to change {game.board[3][0]}.to(2)
    end

  end

  #check if finished
  #board is full
  context 'ending conditions' do
    xit 'board is full' do
      game.board =[[1, 2, 1, 2, 1, 2], [1, 2, 1, 2, 1, 2], [1, 2, 1, 2, 1, 2], [1, 2, 1, 2, 1, 2], [1, 2, 1, 2, 1, 2], [1, 2, 1, 2, 1, 2], [1, 2, 1, 2, 1, 2]]
      expect(game.is_finished?).to be true
    end

    xit 'board is not full' do
      game.board =[[2], [1, 2, 1], [1], [1, 2], [2], [2], [1]]
      expect(game.is_finished?).to be false
    end
  end

    #last player won
    # check row
    xit 'last play won row 1 move only' do
      game.board =[[2], 
                   [],
                   [],
                   [],
                   [],
                   [],
                   []]
      expect(game.is_finished?).to eq(false)
    end
    it 'last play won row' do
      game.board =[[1], 
                   [1],
                   [1, 4, 5, 6],
                   [1, 8, 9, 10, 11],
                   [12, 13],
                   [2, 2, 1, ],
                   [1, 2, 1]]
      expect(game.is_finished?).to eq(true)
    end

    # check column
    it 'last play won col' do
      game.board =[[], 
                   [1, 1, 1, 1],
                   [1, 2, 1, 2, 1, 2],
                   [2],
                   [2, 1, 2, 1, 2],
                   [1, 2, 1, 2, 1, 2],
                   [1, 2, 1, 2, 1, 2]]
      expect(game.is_finished?).to be true
    end

    # check diagonal
    it 'last play won diag' do
      game.board =[[1], 
                   [1, 1, 2],
                   [1, 2, 1, 2],
                   [2, 2, 1,1],
                   [2, 1, 2, 1, 2],
                   [1, 2, 1, 2, 1, 2],
                   [1, 2, 1, 2, 1, 2]]
      expect(game.is_finished?).to be true
    end

    # check anti-diagonal
    it 'last play won antidiag' do
      game.board =[[1], 
                   [2, 1, 2],
                   [1, 2, 1, 1],
                   [2, 2, 1, 1],
                   [2, 1, 2, 1, 2],
                   [1, 2, 1, 2, 1, 2],
                   [1, 2, 1, 2, 1, 2]]
      expect(game.is_finished?).to be true
    end

end

#create game