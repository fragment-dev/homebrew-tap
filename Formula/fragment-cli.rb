require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://fragment-cli-prod.s3.us-west-2.amazonaws.com/fragment-cli.tar.gz?versionId=0M9mQZcqn72d..sVBEiehG3itAqSHHfv"
  version "2022.11.17"
  sha256 "1e1beefbfeb507682337d37768a222e20b931ef1b37610c1de367f544817a937"
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
