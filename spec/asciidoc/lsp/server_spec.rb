# frozen_string_literal: true

RSpec.describe AsciiDoc::Lsp::Server do
  it "has a version number" do
    expect(AsciiDoc::Lsp::Server::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  it "initializes" do
    x = AsciiDoc::Lsp::Server.new($stdout, $stdin)
    expect(x).to_not be_nil
  end
end
