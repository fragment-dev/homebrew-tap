require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5090.0.0-darwin-x64.tar.gz"
    sha256 "52db015800d4dce7406b85df4edf798013d46624c28500f58d5d64b29fbce6c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5090.0.0-darwin-arm64.tar.gz"
      sha256 "8502f9c1ad0db212a37efeb8c1db9da2544628290a80d7dffab57ed888f44b71"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5090.0.0-linux-x64.tar.gz"
    sha256 "446e26642558d1caf1c221d59f1c273c4d5e11899ec88d2785579a338a66ab5b"
  end
  version "5090.0.0"
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
