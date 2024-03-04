require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.4-1-darwin-x64.tar.gz"
    sha256 "21d6ee0689ccd95080ca646a5436c7509b6e099edec97fc353e99d5ef85cd503"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.4-1-darwin-arm64.tar.gz"
      sha256 "a0e8d14be769307594e0fcce59f3789338db6a024756e2197992037cf44717af"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.4-1-linux-x64.tar.gz"
    sha256 "a3ad7c39e1e6bb5fd9e3fa1f18e386e4bfe8961ef5ddb27ea0642afb49f8d97b"
  end
  version "2024.3.4-1"
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
