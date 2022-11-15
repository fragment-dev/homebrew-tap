require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://fragment-cli-prod.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz?versionId=lmiNG1qtug_tBag93RUCytpPwr7hshY7"
  version "2022.11.15"
  sha256 "ce70629a2217431086fd1506c79a2bf277e187bb0fcf1579dc1862f586a4dbf9"
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
