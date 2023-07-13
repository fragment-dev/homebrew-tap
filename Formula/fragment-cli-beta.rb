require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3060.0.0-darwin-x64.tar.gz"
    sha256 "cbfcd3e6268c85d9c786091c662b19a0d365c702a74c594d71145ef0921091ac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3060.0.0-darwin-arm64.tar.gz"
      sha256 "9cb7c73aa6bdcab7e94af5b33170381b5b040a239de5214a641d037a6d50b1f0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3060.0.0-linux-x64.tar.gz"
    sha256 "56ec36969214d7af3843c56c6028445e78e639f6958d8efa7c8b03e7135235ad"
  end
  version "3060.0.0"
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
