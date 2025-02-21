require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6259.0.0-darwin-x64.tar.gz"
    sha256 "2e98b35f10899066d98dd24c7dce9f9931bdb8b171ed1aea2776686ffb1ff598"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6259.0.0-darwin-arm64.tar.gz"
      sha256 "7cc0d4b60e77cdbeec8f72196ed259938be1c1bc9160a11c004d021696dde073"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6259.0.0-linux-x64.tar.gz"
    sha256 "f72307ce36482f37ead04b3194899428f8b7614ce80132561317a682effaa1a5"
  end
  version "6259.0.0"
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
