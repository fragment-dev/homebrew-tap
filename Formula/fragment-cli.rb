require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-3-darwin-x64.tar.gz"
    sha256 "fcc2a70456e03a1ddb8f9850a51b6939769ad689c6ea0a14fb80c2ca0e4b23fc"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-3-darwin-arm64.tar.gz"
      sha256 "63d3d088ed274434090b0d4f6ac651893a139a8bbc2e3f278929e680d65f30fc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-3-linux-x64.tar.gz"
    sha256 "caf638a429b2f2436a2addb2c28659f3520454f15f3f75e675cbcc3d1835b9d8"
  end
  version "2024.12.24-3"
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
