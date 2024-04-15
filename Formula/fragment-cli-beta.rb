require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4898.0.0-darwin-x64.tar.gz"
    sha256 "077d7110b3a6345514af3aa65a1d55699db7ed8586b6bb3c1b1158196bf6e7be"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4898.0.0-darwin-arm64.tar.gz"
      sha256 "49609aed7458f2372e19c3cdf73c3a1d225355078466ab0d57245ed08b79d269"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4898.0.0-linux-x64.tar.gz"
    sha256 "20934e656733d9ac72dbfe2e468b1873a9f755368029fc68dda442c7bb54d8c3"
  end
  version "4898.0.0"
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
