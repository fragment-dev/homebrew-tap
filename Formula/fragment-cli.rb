require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.10-darwin-x64.tar.gz"
    sha256 "8c4614af0964fb7e42db0649e7f625b1918fd04f973365f8839ca43ece5c13c1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.10-darwin-arm64.tar.gz"
      sha256 "bd8eeb18c82a920197b2f69138b8bd0bcc2c753af5022d6e0ce986367a6207e6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.10-linux-x64.tar.gz"
    sha256 "c7584e64b12ab4fd26cc327f0fc38c6b60292c9dcc46842465d3c756d8d89921"
  end
  version "2024.1.10"
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
