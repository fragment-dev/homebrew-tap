require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3229.0.0-darwin-x64.tar.gz"
    sha256 "2d3545d8a4eff32f84b1a8c4bcdc9fc8997d67929c961b9b63ee0914073a24ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3229.0.0-darwin-arm64.tar.gz"
      sha256 "630eb3eb65c34bbec1b9082527f5b1bc242d64324efae386e3ed94da295c84b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3229.0.0-linux-x64.tar.gz"
    sha256 "98948a2a1ffe4467d3748baa17d1d36299493919c1dae2c903a5a2d8d039fcdb"
  end
  version "3229.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
