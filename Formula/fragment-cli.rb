require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.1-darwin-x64.tar.gz"
    sha256 "1b4faafdd422752ea8e9d93bf5703a5b606ca1869659bd12fa3efab2d712b6a4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.1-darwin-arm64.tar.gz"
      sha256 "fbfffe47718e8f8c84f25ffc09b72aca787c7973339ba93cdeb36dad2bdfc316"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.1-linux-x64.tar.gz"
    sha256 "8c0ac1765807cfa70126de711804048168bd63b5588a18d8b2b575f5e6267980"
  end
  version "2024.4.1"
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
