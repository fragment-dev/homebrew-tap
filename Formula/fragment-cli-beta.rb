require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3784.0.0-darwin-x64.tar.gz"
    sha256 "f6ae3a4e63b352df5ec53d8e7fdc71aff5ea6f74c4bd68d454e6569f9c9f51cc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3784.0.0-darwin-arm64.tar.gz"
      sha256 "24db1797488e1c01c500742b204c56dda5dd5a837748f9ee9bc36d04b3b718d2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3784.0.0-linux-x64.tar.gz"
    sha256 "e65045db44c561dd80c66ee7312d9f94ac7ed5ef103c20d8365cce0cd1fee732"
  end
  version "3784.0.0"
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
