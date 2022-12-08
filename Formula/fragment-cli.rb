require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2022.12.7.tar.gz"
  version "2022.12.7"
  sha256 "477b531854e185fc6cd91cd50c0045dc76126a0644ef23dc8584dbb3b1618f2d"
  license "MIT"
  depends_on "node@16"

  def install
    system "npm", "install"
    system "npm", "run", "build", "prod", "2022.12.7"
    bin.install Dir["dist/*"]
    man.mkpath
  end

  test do
    raise "Test not implemented."
  end
end
