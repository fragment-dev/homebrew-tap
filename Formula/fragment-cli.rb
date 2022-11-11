require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  # TODO: change this and the SHA to the newly uploaded ones after https://github.com/fragment-dev/workspaces/pull/1868 gets merged
  url "https://fragment-cli-test.s3.amazonaws.com/fragment-cli.tar.gz"
  version "2022.11.9.2"
  sha256 "92ebc56bf0b4f2df771c9b56f1115df73fde2771535f589b1791407e6f0d1b04"
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
