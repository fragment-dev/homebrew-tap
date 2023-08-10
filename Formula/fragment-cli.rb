require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.10-1-darwin-x64.tar.gz"
    sha256 "1cd87497d68588e971b0bdba4db566e76e26c53f20abf8b7b94e46a55b25e8fa"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.10-1-darwin-arm64.tar.gz"
      sha256 "10c93f570b6bec517231ad505bba0f6876373c5d77ffc2adb89f83c764852d7c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.10-1-linux-x64.tar.gz"
    sha256 "2626a4a6f4b6a15c896e4e6b169db8d2b492a9d1684ce37453c1dbfec9abbe74"
  end
  version "2023.8.10-1"
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
