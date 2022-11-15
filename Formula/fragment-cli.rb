require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://fragment-cli-prod.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz?versionId=E0KSAbOgytvr9Ea7rY7kNB.enj0goU_B"
  version "2022.11.15"
  sha256 "c1b6ff4b38a4b31f0c0208b0d1c31b480a0002dd019aa33cd2acc3ce39893fde"
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
