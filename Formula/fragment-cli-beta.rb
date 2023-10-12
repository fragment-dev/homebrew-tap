require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3813.0.0-darwin-x64.tar.gz"
    sha256 "22ba3313305a6874aefa2c4a037d4bfc9887a9456400ce63743c1b2f9c53ddf7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3813.0.0-darwin-arm64.tar.gz"
      sha256 "a2f24f290a636ae4af2dc7c011991ce438907623c3b0fc56a21fa3acb64a00af"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3813.0.0-linux-x64.tar.gz"
    sha256 "215afbdfbcab620b5ec1a41902430b0331644cb33d1243d063f05e57c477d46b"
  end
  version "3813.0.0"
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
