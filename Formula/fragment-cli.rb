require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.14-darwin-x64.tar.gz"
    sha256 "0dcc30f52d3f74ad094c3b079d24053b4aa27d2b6cbaacb524db10ef9ce76742"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.14-darwin-arm64.tar.gz"
      sha256 "ac28f989728ca5818b8746cbfa30e8e8d2699b987aeb0d3340a38d4b41dab9b8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.14-linux-x64.tar.gz"
    sha256 "9fd810df57d5a34d8d84cdef7d5fb73be0a46b7282624e2f48a9dae5c451459a"
  end
  version "2023.7.14"
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
