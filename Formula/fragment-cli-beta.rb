require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6040.0.0-darwin-x64.tar.gz"
    sha256 "9b2b744d21fc3b1d56ecc5c1267d398a587b69903e586f293d68541c553a612a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6040.0.0-darwin-arm64.tar.gz"
      sha256 "0d63147bd68bf51e25dde675e04b8e5c733b46d8cafe907193e9334dc22b42f2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6040.0.0-linux-x64.tar.gz"
    sha256 "352100d03d3d7b11e986b59a9fb2faa81d85a2c8e587731e2dc8ef6fb2e0932a"
  end
  version "6040.0.0"
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
