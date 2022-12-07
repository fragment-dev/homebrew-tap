require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1507.0.0.tar.gz"
  version "1507.0.0"
  sha256 "b7a1f520ec7b7a1aff56c12f4c720d5dcf1d05379b15da18f0dd68c9fa341869"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build", "dev", "1507.0.0"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
