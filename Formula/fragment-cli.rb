require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
<<<<<<< Updated upstream
  url "https://fragment-cli.s3.amazonaws.com/fragment-cli.tar.gz"
  version "2022.11.9"
  sha256 "0335dc5a17d13de6ee03b4354ba5b9d3c8199ceb2aa032511ed052a8bf6db396"
=======
  # TODO: change this and the SHA to the newly uploaded ones after https://github.com/fragment-dev/workspaces/pull/1868 gets merged
  url "https://fragment-cli-test.s3.amazonaws.com/fragment-cli.tar.gz"
  version "2022.11.9.2"
  sha256 "92ebc56bf0b4f2df771c9b56f1115df73fde2771535f589b1791407e6f0d1b04"
>>>>>>> Stashed changes
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
