require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.30-1-darwin-x64.tar.gz"
    sha256 "7357acaf17e69a644aad581c0f7db8a5a3a2bb62cfc164cc90934ac9225d99e6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.30-1-darwin-arm64.tar.gz"
      sha256 "fff83a0a877141afc40dfef7edd0654510efe87f9e6f0019089b5135f2649a14"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.30-1-linux-x64.tar.gz"
    sha256 "4080113df5bcc11ea2ec7c703561d6a6d910ebbf8605bc0629024439ee72b113"
  end
  version "2023.3.30-1"
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
