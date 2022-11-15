require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://fragment-cli-prod.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz?versionId=fWSj3xyhnb4VrfBufb38t3qSG5ByumYt"
  version "2022.11.15"
  sha256 "e45447f14512d5af96c1f1400fe79e3ca4cc62e65a5b4c14df2d6062d6d70785"
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
