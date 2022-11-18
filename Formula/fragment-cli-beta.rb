require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  url "https://fragment-cli-dev.s3.us-west-2.amazonaws.com/fragment-cli-v1399.tar.gz"
  version "1399"
  sha256 "8ccd684664a2c515ba016f583fe9730cfdcb263670474b64ad55ae4786b4019b"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
