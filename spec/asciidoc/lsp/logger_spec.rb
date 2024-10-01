# frozen_string_literal: true

require "asciidoc/lsp/logger"

RSpec.describe AsciiDoc::Lsp::Logger do
  it "initializes" do
    x = AsciiDoc::Lsp::Logger.new
    expect(x).to_not be_nil
  end
end
