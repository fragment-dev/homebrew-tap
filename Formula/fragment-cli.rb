require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.27-3-darwin-x64.tar.gz"
    sha256 "dc1b364474116baad2c05b25e6bb3d90aa2e6dae275c5f3991fe2a32059d213a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.27-3-darwin-arm64.tar.gz"
      sha256 "e95ca0829f57fb663eed7ed3ea4aba674358be298bdf0bba0e16e3bcc0426ef1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.27-3-linux-x64.tar.gz"
    sha256 "546e07c5959ccdef206bd112f1b3d34161b9a8930472eb31de69ddab3f6e5494"
  end
  version "2023.12.27-3"
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
