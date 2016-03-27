require 'spec_helper'

describe Differin do
  let(:diff) { Differin::Diff.new('examples/file1.txt', 'examples/file2.txt') }

  it 'diff two files' do
    result = diff.process

    expect(result.class).to eq(Array)
    expect(result.first.class).to eq(Hash)
  end

  it 'render as array' do
    diff.process
    result = diff.render(Differin::Renderers::Array)

    expect(result.class).to eq(Array)
  end

  it 'render as json' do
    diff.process
    result = diff.render(Differin::Renderers::JSON)

    begin
      JSON.parse(result)
      is_json = true
    rescue JSON::ParserError
      is_json = false
    end

    expect(is_json).to eq(true)
  end

  it 'short version to run diff' do
    result = Differin.diff('examples/file1.txt', 'examples/file2.txt')
    expect(result.class).to eq(Array)
    expect(result.first.class).to eq(Hash)
  end

  it 'short version to run diff with options' do
    result = Differin.diff('examples/file1.txt', 'examples/file2.txt',
                           renderer: Differin::Renderers::JSON)

    begin
      JSON.parse(result)
      is_json = true
    rescue JSON::ParserError
      is_json = false
    end

    expect(is_json).to eq(true)
  end

  it 'check existed engine' do
    expect(Differin.engine_exists?(Differin::Engines::LCS)).to eq(true)
  end

  it 'check not existed engine' do
    expect(Differin.engine_exists?('NotExistedEngine')).to eq(false)
  end

  it 'has a version number' do
    expect(Differin::VERSION).not_to eq(nil)
  end
end
