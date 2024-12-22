require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5958.0.0-darwin-x64.tar.gz"
    sha256 "c7dd810927d0bceb78ada43c5309d5ac9c5a61c83af73c6a246c0134c4dddec3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5958.0.0-darwin-arm64.tar.gz"
      sha256 "0d7218561fe8a5a64ac95d28ad4bce6aeb5e5b5786a37d5b619ae204b3ad1af7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5958.0.0-linux-x64.tar.gz"
    sha256 "65bdeba5963e98fd9673fd78f80c5d9dd1f905b0cd44b2bfb7476921e6c967d9"
  end
  version "5958.0.0"
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
