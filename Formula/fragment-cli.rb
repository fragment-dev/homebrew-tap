require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://fragment-cli.s3.amazonaws.com/fragment-cli.tar.gz"
  version "1.0.0"
  sha256 "c9100abdcc5486287f2ccec790bb083d21ae30ca446fcae435cac61a3344ae19"
  license "None"
  depends_on "node@16"

  def install
    bin.install Dir["*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
