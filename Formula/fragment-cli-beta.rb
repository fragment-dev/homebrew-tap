require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3316.0.0-darwin-x64.tar.gz"
    sha256 "5ad87a85cdc4323c05ceb8507156905c2f8a320562194bf32324d8ff1c900a7f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3316.0.0-darwin-arm64.tar.gz"
      sha256 "ad7e067f57f6ece7d63a8e267c43322b07c30dad99af632772058185c6c827db"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3316.0.0-linux-x64.tar.gz"
    sha256 "c59d6d043b41e79b76a2b60043b380ae74af8717515abd915eca7ccec75d6aed"
  end
  version "3316.0.0"
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
