require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2617.0.0-darwin-x64.tar.gz"
    sha256 "55456cf72c0e11dd93d26ffc1fe29a4bceb613ea5375a30d15e47b375b15bdcb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2617.0.0-darwin-arm64.tar.gz"
      sha256 "9ec4219d84d8ca734bb053994bd982dbd940b544ba2a4f688998966907fe8bcb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2617.0.0-linux-x64.tar.gz"
    sha256 "88e355c5293163af4eb04092c6a751085f8c70e8eeeedd987bfdfcc2e2139209"
  end
  version "2617.0.0"
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
