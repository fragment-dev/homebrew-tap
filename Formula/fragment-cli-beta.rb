require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1719.0.0.tar.gz"
  version "1719.0.0"
  sha256 "35acd29647b456b140934af11d916a91272434585646c5d0c52b0f23bf0128e3"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build", "dev", "1719.0.0"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
