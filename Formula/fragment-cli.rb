require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.25-darwin-x64.tar.gz"
    sha256 "5fbe76e4fd24c09c9755aebf7594f5bc066950d427f59c596b7b1b60b39c471a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.25-darwin-arm64.tar.gz"
      sha256 "8120c1a20f0f6500f6b1e6a95ef56c33aa4355c61ae13485a11045f5a4529af8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.25-linux-x64.tar.gz"
    sha256 "4e9f7a7a54c296538e7e8eed4b0934ecb38b01f31947cbdec3e0a3c60895e220"
  end
  version "2023.9.25"
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
