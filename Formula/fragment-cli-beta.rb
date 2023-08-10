require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3277.0.0-darwin-x64.tar.gz"
    sha256 "24a4f926650d5e60f9f650021d5bdc577f11c13d18c977e3c5488889600173df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3277.0.0-darwin-arm64.tar.gz"
      sha256 "4ed0b1643447e09668e65ff65a5bf67753890fd1f4a84b2ab12706b6b3b8a06f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3277.0.0-linux-x64.tar.gz"
    sha256 "4cefb3758e3365500a37b25de9b5645180a5eec11d44d3504bcfd309990d6e60"
  end
  version "3277.0.0"
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
