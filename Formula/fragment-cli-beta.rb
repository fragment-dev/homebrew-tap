require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2800.0.0-darwin-x64.tar.gz"
    sha256 "cdba8a10aa81e25605b00d2dd75f64b7694d08c030bcaae58e3a43a2d8ad04d0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2800.0.0-darwin-arm64.tar.gz"
      sha256 "6a355efdf889f19952527021ce80398304e85a6860c1df6728be635d2c36fc4c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2800.0.0-linux-x64.tar.gz"
    sha256 "0dbb4370af1f8c2c5df0ff6f134789ae501ef263127366a0484a65a886b4c600"
  end
  version "2800.0.0"
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
