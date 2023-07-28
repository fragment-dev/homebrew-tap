require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3187.0.0-darwin-x64.tar.gz"
    sha256 "4689d46ce2e388b092c5f5105bfa061e6374b4f588f0a4b879ddb2ddeab7192d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3187.0.0-darwin-arm64.tar.gz"
      sha256 "2e69c4549294cf16d203c4227aa9ba0554437f48ae70eb9fcb6b25034555f782"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3187.0.0-linux-x64.tar.gz"
    sha256 "5bf291bce8193d8560ce28a0b1812de8e6f21250a896bfd1fd7e6e3045601d3a"
  end
  version "3187.0.0"
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
