require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3665.0.0-darwin-x64.tar.gz"
    sha256 "8737944a6e620c9602a3c6360ecfa9f2d6608ecffaeef2bca3cd5e6b6c137875"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3665.0.0-darwin-arm64.tar.gz"
      sha256 "db5c4223e04be433228d9d0999244b704413a45547f36b0a17563afa2434f0f0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3665.0.0-linux-x64.tar.gz"
    sha256 "500fb42356f41a5da7cb386b0cff76289a61d0e0334797816e33ef124b16bacd"
  end
  version "3665.0.0"
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
