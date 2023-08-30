require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.30-darwin-x64.tar.gz"
    sha256 "48aad755580742a8b6972fa3c6d70e62fcfd8740eeb281012500b5059d6327d9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.30-darwin-arm64.tar.gz"
      sha256 "5dec8854681a58e1ec3755424ca98ac1c272d330fd30c0ba31d6e55a1361dbf1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.30-linux-x64.tar.gz"
    sha256 "0b2f3162eaf7b916e625239b8796a1ef3e4f678a1945c5cc95ad8e6fcafc5e92"
  end
  version "2023.8.30"
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
