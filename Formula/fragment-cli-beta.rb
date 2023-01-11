require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1717.0.0.tar.gz"
  version "1717.0.0"
  sha256 "f346c30f66966eecf1cb6e30b1523fbc0e5e8cc479b39d1444e29b45309f61fe"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build", "dev", "1717.0.0"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
