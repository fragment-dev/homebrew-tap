require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.15-darwin-x64.tar.gz"
    sha256 "ed93da2d1f5445bca2999daacf102f718b7b8a1e574447842c8d7290f8d5fd07"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.15-darwin-arm64.tar.gz"
      sha256 "1b0cb8351fc4a02315b3eb40b5c5cb39be015c7c62eee14cfdcc4d9475c3032e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.15-linux-x64.tar.gz"
    sha256 "fb9452aede1e643042cc859b9c3dcb8976bb971fd87dc61bd8ceaaa101ddb6ac"
  end
  version "2024.11.15"
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
