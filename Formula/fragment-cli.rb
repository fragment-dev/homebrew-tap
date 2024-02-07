require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.6-1-darwin-x64.tar.gz"
    sha256 "42313ce01af03c12eed6b1d1750a9be33e1c109d74c022dc84856aecc4ed09b4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.6-1-darwin-arm64.tar.gz"
      sha256 "1569a24644975350d3d84228325663f6bfa7ff84ebff24c0868e70f4ec3adb05"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.6-1-linux-x64.tar.gz"
    sha256 "75e4f351694849b004913de986866e2c132af74104f9ae01b3196204280cafd0"
  end
  version "2024.2.6-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
