require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2805.0.0-darwin-x64.tar.gz"
    sha256 "9dcfa4f543ea4c80e00bc0d091aa25d68252feef3937bc558f5c93cc9490b50d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2805.0.0-darwin-arm64.tar.gz"
      sha256 "dc18732367ac553008f9eb077844a42da89a3babcb5f13f7185a9f722f7c4e57"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2805.0.0-linux-x64.tar.gz"
    sha256 "3d0db7eef0b4d407ae3e247bb5f2c549cb7aed20821dffa4b7dddb3f8a6e336e"
  end
  version "2805.0.0"
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
