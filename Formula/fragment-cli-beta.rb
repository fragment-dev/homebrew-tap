require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3011.0.0-darwin-x64.tar.gz"
    sha256 "bb37f1e6769dcc5d9622571f0dff1d8b0155ad1007e5a6002f567628ba4a0d16"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3011.0.0-darwin-arm64.tar.gz"
      sha256 "106f63a037c8a287a8e3696566cf71db49959a447420c6479993519f71eab6ab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3011.0.0-linux-x64.tar.gz"
    sha256 "a08a826c83d7cb627409684de77dc084b31f7be078852f155fb2a48c33d1c7d4"
  end
  version "3011.0.0"
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
