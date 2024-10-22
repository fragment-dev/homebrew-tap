require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.21-1-darwin-x64.tar.gz"
    sha256 "c7ae5f5fbb100bd762dd2d30350124526371153ddedf824a814e1898bb64b85a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.21-1-darwin-arm64.tar.gz"
      sha256 "9fd8aa65cbe314a3741c07013355a9ab5e3ea4e6dfaa91981725160dcd3d3864"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.21-1-linux-x64.tar.gz"
    sha256 "f2ccbb6ae059d22d69ca80b9e297948e5b98ef6a12659e9340ac54685618cc49"
  end
  version "2024.10.21-1"
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
