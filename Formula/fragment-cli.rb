require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.9-1-darwin-x64.tar.gz"
    sha256 "d3fd74fe5871571781bb3ba7fdf0bfd9d8dfe505a86bcb63ef27cba124db94cb"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.9-1-darwin-arm64.tar.gz"
      sha256 "0e771e9a5979147bd3e54ad7da72f73a78de3424c235ad3f52cc5c083fa75dae"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.9-1-linux-x64.tar.gz"
    sha256 "1a1f905dc2cd376fe4aa4951c068e8e3213d7566b2c05b93e4d0118dcf8ac901"
  end
  version "2024.2.9-1"
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
