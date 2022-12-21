require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2022.12.21.tar.gz"
  version "2022.12.21"
  sha256 "b644e933971ac15bc665749eb3ae6f7769037e00432f5e611a85c6cf51807488"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build", "prod", "2022.12.21"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
