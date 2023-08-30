require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-5-darwin-x64.tar.gz"
    sha256 "32d0bef1aeac89f0fe5fa9255acbdc4f8ed28ab4b059a0ce25707630569f54e9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-5-darwin-arm64.tar.gz"
      sha256 "178ecf5e13d36ff5ce834225fc1acd24cccab736a6e695220a83d726001213fe"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-5-linux-x64.tar.gz"
    sha256 "a406bac2ca9afc6bc8e5e604c9307e4c91256675209b2302a1f0477829eaacfb"
  end
  version "2023.8.29-5"
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
