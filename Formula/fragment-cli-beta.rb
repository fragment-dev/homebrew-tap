require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4583.0.0-darwin-x64.tar.gz"
    sha256 "ea74d6fca5b01598ae6e02a03ed83b4182d12844e4bbaf7ad9fbdea1fc586878"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4583.0.0-darwin-arm64.tar.gz"
      sha256 "c36e43b756cf104234dcce4915d7b812347a9ef9275711c249213e8b87dc9b15"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4583.0.0-linux-x64.tar.gz"
    sha256 "6413169698c5de42f9c2e9917960b2046bc2282811217729dbf918d574d8b3f2"
  end
  version "4583.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
