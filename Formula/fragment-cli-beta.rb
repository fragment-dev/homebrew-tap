require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1729.0.0.tar.gz"
  version "1729.0.0"
  sha256 "d5fd153f62c7d769e21b242dc73e4e27687b64231cf9cbbbca562f8a829b632a"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build", "dev", "1729.0.0"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
