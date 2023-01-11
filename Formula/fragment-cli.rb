require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.1.10.tar.gz"
  version "2023.1.10"
  sha256 "45cf4f02474b7ae3de72ce737545c473d96972734538929afeb2a1c20734c804"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build", "prod", "2023.1.10"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
