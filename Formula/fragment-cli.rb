require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.13-4-darwin-x64.tar.gz"
    sha256 "4df176437d408b79491dcf72079ce7aae9c521b844d7f59175a472a79d57a077"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.13-4-darwin-arm64.tar.gz"
      sha256 "dee2d98c47b8925dab0e6cf18b777a4555a31a8d3a65c3f05dde41cf2970c80b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.3.13-4-linux-x64.tar.gz"
    sha256 "c1e6831b483cc4f05a6b8819d7e2a7e4a228f5c13817cc651784bf3162b6593b"
  end
  version "2025.3.13-4"
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
