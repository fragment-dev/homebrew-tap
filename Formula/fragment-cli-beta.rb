require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3569.0.0-darwin-x64.tar.gz"
    sha256 "dea9f804baeb5d3c29e0e434a16c9c0d9748bc6631dca3fadddd58c2cc268dbb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3569.0.0-darwin-arm64.tar.gz"
      sha256 "61c6c27b721c28d1563ba45f1a4f8eea1e4d7f48b312c7e5d59b9496d6460d3d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3569.0.0-linux-x64.tar.gz"
    sha256 "62bdf0668f9bd2a0ad0ce89b26fb8bef8f6e1b8d4c3dd0fc32e2a9e6d61a0bf5"
  end
  version "3569.0.0"
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
