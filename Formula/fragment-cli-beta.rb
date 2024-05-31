require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5157.0.0-darwin-x64.tar.gz"
    sha256 "56589da65029065d77dbd80568dd8304bdfe86c3939bec34e63687de624f6e16"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5157.0.0-darwin-arm64.tar.gz"
      sha256 "d44b36f9b400b776ac2bf10a2d5e44a2fa93948e6a9263d630f7db1297153ddf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5157.0.0-linux-x64.tar.gz"
    sha256 "b098a2b4df5fe626d46fa8c584cd1b835fc47f5e751fb6ca4fbd9712acfd5ed5"
  end
  version "5157.0.0"
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
