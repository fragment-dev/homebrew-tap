require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.28-1-darwin-x64.tar.gz"
    sha256 "3b4831ba804c2ee96a63bb53e8b6e027fc9b5f659d2e4a049d2897f94e3f2475"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.28-1-darwin-arm64.tar.gz"
      sha256 "253993709d336c0f59dbe2381ab6447afd4a6247ec4339c1aa83b02de5f852c4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.28-1-linux-x64.tar.gz"
    sha256 "654514754f96b5ef1eb538dc9074623a1e9966514ed4481b2d94f003a8176d41"
  end
  version "2024.2.28-1"
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
