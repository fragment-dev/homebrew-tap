require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.15-darwin-x64.tar.gz"
    sha256 "3ec15aa335c7269b70771f5e5adcf453bf26d26cd1f2e25405fc53a16b31328a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.15-darwin-arm64.tar.gz"
      sha256 "6e7240cd330164a30900fef123572c061e5f81f3587808cf2052ac6750c7a995"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.15-linux-x64.tar.gz"
    sha256 "995b0688776b87c81666295897212c257569be413312941c3f2bcaed93d9a504"
  end
  version "2024.7.15"
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
