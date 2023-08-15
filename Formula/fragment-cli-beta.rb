require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3330.0.0-darwin-x64.tar.gz"
    sha256 "3041bf2f2abaa12791a4db9a0869b9e81c28ee94f0b95b2f5819669ed6d60d80"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3330.0.0-darwin-arm64.tar.gz"
      sha256 "4f5be42038a25d3799ed03956cf205cbe2778cd5cd23f7d5177e6660d6c56be4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3330.0.0-linux-x64.tar.gz"
    sha256 "e22d39903da3fdedce0ebe0da9f04cc0cd6068ee39d40635f533d5242c93bfa6"
  end
  version "3330.0.0"
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
