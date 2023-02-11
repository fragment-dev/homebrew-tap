require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.10-darwin-x64.tar.gz"
    sha256 "7c11fa515813ec32c92309b12788f9e541d8a65340dda9b42081cafb6177a26e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.10-darwin-arm64.tar.gz"
      sha256 "c467cad7fe6f9ff3e7b1ff2724181f7c1870a6d360f2cd1de6c79a856ea992e6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.10-linux-x64.tar.gz"
    sha256 "7ceb07dff6846740ed7b55716bec727d1bcea1282fe6e9e2e3585897f5d9b5e9"
  end
  version "2023.2.10"
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
