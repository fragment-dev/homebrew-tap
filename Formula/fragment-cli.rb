require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.23-1-darwin-x64.tar.gz"
    sha256 "096bfc8f3e125911a16747962e0f929b17c8f37d0ddfe000e8a0bad8e1201e90"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.23-1-darwin-arm64.tar.gz"
      sha256 "3255a53cc37c4f7ff8c294da3afddd2e4167c4a0ac1458173174bb734346b92c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.23-1-linux-x64.tar.gz"
    sha256 "e3d7cf38b1532edd65be82398352c6f64787adcb9f30ba2924bc2ff4c9a65fe7"
  end
  version "2024.10.23-1"
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
