require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  url "https://fragment-cli-dev.s3.us-west-2.amazonaws.com/fragment-cli-v1420.tar.gz"
  version "1420"
  sha256 "4af2271cee620613e305eb7d645a80bd71add48d96ff108bc0069b38007d3adf"
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
