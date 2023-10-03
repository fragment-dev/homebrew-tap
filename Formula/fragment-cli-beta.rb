require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3754.0.0-darwin-x64.tar.gz"
    sha256 "2b40f01f620b6098eada08897807f532dae589bda88c8b68afe6fd66c3874ef9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3754.0.0-darwin-arm64.tar.gz"
      sha256 "d107f428930d631a6a4b5bfcf5eee8db5860a91845af6107f59151ce85e8f317"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3754.0.0-linux-x64.tar.gz"
    sha256 "15490540939c499fcbccebfee0f9fb55e8a14ab13d812b7cf31eab810b52699f"
  end
  version "3754.0.0"
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
