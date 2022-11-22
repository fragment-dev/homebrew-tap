require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  url "https://fragment-cli-dev.s3.us-west-2.amazonaws.com/fragment-cli-v124.0.0.tar.gz"
  version "124.0.0"
  sha256 "7ba773e73b0d971e8dfcbff371cbac3761e0bcb21a03488a921086b041982d70"
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
