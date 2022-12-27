require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2022.12.26.tar.gz"
  version "2022.12.26"
  sha256 "3afdfb7709e72e5c5d0d2eac2736a7fd8a1795741213865b77be31873a33cd6e"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build", "prod", "2022.12.26"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
