require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2567.0.0-darwin-x64.tar.gz"
    sha256 "b4b294a9205e65b40128055aa5f97ead5a2c735b2f6e58c0c0660d0772f97f3e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2567.0.0-darwin-arm64.tar.gz"
      sha256 "39585f7414c2e52d3905cd53723b6888b1198a5b21308f870e4dc0eb9593d8c3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2567.0.0-linux-x64.tar.gz"
    sha256 "1d02a1070f0fa5965abd7221cce4424426742fb8701584d8b587939a5bb3b73e"
  end
  version "2567.0.0"
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
