require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://fragment-cli.s3.amazonaws.com/fragment-cli.tar.gz"
  version "2022.11.9.1"
  sha256 "50016a7b4d86664b8db8a9e7d23f0a8a0ebfb4c7e59c02d6ff8d9760421ea09a"
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
