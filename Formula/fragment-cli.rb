require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-3-darwin-x64.tar.gz"
    sha256 "4cf59acb6d6e21e7cbdfd2c4048c424ef2c6ef69d57182b24d3d9bc9bf95ac2a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-3-darwin-arm64.tar.gz"
      sha256 "3599871be3d2a42969c6365722f05a4952323a19453107b927a79dfb9d63ef4b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-3-linux-x64.tar.gz"
    sha256 "687da80b4af0f1d6374ba688fce30611d0a436c29e0e3107aa2db34095da89a8"
  end
  version "2024.12.20-3"
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
