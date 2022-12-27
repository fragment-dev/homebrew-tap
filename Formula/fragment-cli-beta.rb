require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1638.0.0.tar.gz"
  version "1638.0.0"
  sha256 "731e17ae5086eaf71205908c122797b0026d8960636bbdaa00b9967b3673912a"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build", "dev", "1638.0.0"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
