require_relative 'spec_helper'

describe 'Counter Page' do

  before do
    @page = Page.new @driver
  end

  describe 'click + button twice' do
    context 'counter label' do
      subject { 2.times { @page.click name: '+' } }
      let(:label) { @page.find name: '2' }
      it { subject; expect(label.text).to eq '2' }
    end
  end

  describe 'click - button twice' do
    context 'counter label' do
      subject { 2.times { @page.click name: '-' } }
      let(:label) { @page.find name: '0' }
      it { subject; expect(label.text).to eq '0' }
    end
  end

  describe 'click - button twice again' do
    context 'counter label' do
      subject { 2.times { @page.click name: '-' } }
      let(:label) { @page.find name: '-2' }
      it { subject; expect(label.text).to eq '-2' }
    end
  end
end
