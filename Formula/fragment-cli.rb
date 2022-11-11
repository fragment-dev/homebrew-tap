require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://fragment-cli.s3.amazonaws.com/fragment-cli.tar.gz"
  version "2022.11.9"
  sha256 "0335dc5a17d13de6ee03b4354ba5b9d3c8199ceb2aa032511ed052a8bf6db396"
  license "MIT"
  depends_on "node@16"

  def install
    bin.install Dir["*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
