require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-4-darwin-x64.tar.gz"
    sha256 "e4316f5068bebc05aee813d1e1566a8faead70519005dc3bc99d8e8596b05254"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-4-darwin-arm64.tar.gz"
      sha256 "1cec7543d8cca6ffd188eb494887981aba8084a05ffc536efbf194b27bf40410"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-4-linux-x64.tar.gz"
    sha256 "d35881079efae32c5eb969b24277bef2f9b872c689e32dcf91425fdf60575618"
  end
  version "2024.12.20-4"
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
