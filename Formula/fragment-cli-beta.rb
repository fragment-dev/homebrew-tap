require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3353.0.0-darwin-x64.tar.gz"
    sha256 "e03f488e90bc9ca24c2899f095db89c18d7909380fc8cb8e50b2ac10df838d65"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3353.0.0-darwin-arm64.tar.gz"
      sha256 "7e6f96f762c86a82e48c43f0a79e63375e5f04bff810a0d27fa6806fa0ddbae8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3353.0.0-linux-x64.tar.gz"
    sha256 "34ab41dc83dc17ac5e4e51d047b821032630b9606e13d1fb64867f09ccfbf718"
  end
  version "3353.0.0"
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
