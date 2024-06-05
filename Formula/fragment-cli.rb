require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.5-1-darwin-x64.tar.gz"
    sha256 "94f62273c70d018852cb2e83c11fc5bfd7f16986099eec9a2d2cdf7a6ad94d27"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.5-1-darwin-arm64.tar.gz"
      sha256 "25268420460c94c0c5e10e05fab43e2868c4322d637db74fcf300caf8d6bff01"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.5-1-linux-x64.tar.gz"
    sha256 "a765bf2cdf852a22fb4622277fc2a6b982f5a8dd82f1f2c3e55b01fa00e570e6"
  end
  version "2024.6.5-1"
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
