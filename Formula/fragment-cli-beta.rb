require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3176.0.0-darwin-x64.tar.gz"
    sha256 "6e137190bcceabf194d5aa3e0ec709559d12ec4f24c1d1ad4a19ebc5e284cba0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3176.0.0-darwin-arm64.tar.gz"
      sha256 "01b0da492c45065cec78ac7b3d8e2b78f13651d44619987ce4ae24d9458d40b9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3176.0.0-linux-x64.tar.gz"
    sha256 "77e45ab0a4ab13e31a821fe3bfe9d097dec2cf611476dc72054e605340d0b52b"
  end
  version "3176.0.0"
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
