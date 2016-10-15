require 'spec_helper'

describe Betty do
  context 'what can you do for me?' do
    let(:executors) do
      [
        double(help: [{category: 'Apples'}]),
        double(help: [{category: 'Bananas'}]),
        double(help: [{category: 'Cherries'}])
      ]
    end

    let(:what_betty_said) { subject.first[:say]}

    before do
      expect(Betty).to receive(:executors).and_return(executors)
    end

    it 'lists all the executor categories' do
      expect(what_betty_said).to include "Apples\nBananas\nCherries"
    end
  end
end
