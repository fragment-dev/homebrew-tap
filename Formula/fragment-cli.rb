require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.16-darwin-x64.tar.gz"
    sha256 "8fa0b13edb8406a18686c0d63c8de4558bd1626b666b5530b9846b8ad4e9d4c6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.16-darwin-arm64.tar.gz"
      sha256 "74ce1540481dd666cb94018ef81bac4d5df384827a04bfc8391d55a7726579a7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.16-linux-x64.tar.gz"
    sha256 "f163af0fdddda58aef82cac59dfdd27fc3b3e9a10c54b74989ea591cfa1730dd"
  end
  version "2024.4.16"
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
