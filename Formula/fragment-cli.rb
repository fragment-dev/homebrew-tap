require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.4-2-darwin-x64.tar.gz"
    sha256 "633df21479e141359e3777ea32015c7e02ac967e67534fcf808ebc04ed71d86b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.4-2-darwin-arm64.tar.gz"
      sha256 "ff0fa1dc109a70de287bed3b6994eb705ddb865793137e6280ed467c623fb0bb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.4-2-linux-x64.tar.gz"
    sha256 "1e022a0181b0cda4ded1d63230105401d0fecebe19e968b98eedcca5cf4514b7"
  end
  version "2024.3.4-2"
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
