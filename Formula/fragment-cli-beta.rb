require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2577.0.0-darwin-x64.tar.gz"
    sha256 "c5ef78c1b2d6af005181d982cc9c9c9b329fd538066b38f160416e074709270e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2577.0.0-darwin-arm64.tar.gz"
      sha256 "b183c728e926f5728a25fb3e8d5f782bb441bb1e4818d43f6280d3ad472a10e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2577.0.0-linux-x64.tar.gz"
    sha256 "4251c61f1f1ec08fa66a83e3e0438a04fb181ae21bbe37752184f07c335e445a"
  end
  version "2577.0.0"
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
