require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.27-darwin-x64.tar.gz"
    sha256 "041d0350edfcd8ed8d8e3c0b2a4f2cac97eed8d51a41fb51b2c3c7f67d2f0121"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.27-darwin-arm64.tar.gz"
      sha256 "db6583c62e5038637a055e902351b799e7e350f73d8479065ca2dd5cdede4389"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.27-linux-x64.tar.gz"
    sha256 "6823bfc96e5a93956df517f1ec07b862846389317f2e86fd7fef39d6727196f1"
  end
  version "2023.4.27"
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
