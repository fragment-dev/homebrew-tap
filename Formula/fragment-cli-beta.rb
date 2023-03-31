require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2330.0.0-darwin-x64.tar.gz"
    sha256 "cbe6f35cb921e143ed5b8827518f047b620d9087334b8c836cbf94ae58feb922"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2330.0.0-darwin-arm64.tar.gz"
      sha256 "27fdd393a55d9071bc0e5143b4b21ae35346cbd40b3752f171d2816a2ae5298e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2330.0.0-linux-x64.tar.gz"
    sha256 "8cd9f4a7c38a075e9420f7818e13dd0986a662f2ca88964c599cf37025e152ee"
  end
  version "2330.0.0"
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
