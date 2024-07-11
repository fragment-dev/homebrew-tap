require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.11-darwin-x64.tar.gz"
    sha256 "402608ecfe3661a438277bb15fda1dea1467c45d9a23b3153ba88a03698e0f1d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.11-darwin-arm64.tar.gz"
      sha256 "0c1e09204c8ec60e5f27d81c98710f06e824e8ee8b7c4b7fc0e29bdbf2577210"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.11-linux-x64.tar.gz"
    sha256 "77955735a07d7b0d0ac0a51dc18091dc2fb89a93112ce3d27c192b5c4d34a115"
  end
  version "2024.7.11"
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
