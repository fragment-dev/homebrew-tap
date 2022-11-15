require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://fragment-cli-prod.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz?versionId=MPKULYvk8Vl062hzde4pSV4m8YmXyCbt"
  version "2022.11.15"
  sha256 "7bcefbe137cb4c62e18300cc63c6b73ac0eda4f3faa8a4e4a8f8f314bcd7aa77"
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
