require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.8-1-darwin-x64.tar.gz"
    sha256 "b74d9ba66d2985d3ff99d4594ba968d0f70136378b79a0df7b6b2dbf0b0ad0be"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.8-1-darwin-arm64.tar.gz"
      sha256 "b3edd4069d0e13bf9bffeaf71289e5fad75d6833740ee4f42dea4909cadf05fd"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.8-1-linux-x64.tar.gz"
    sha256 "2403804d83575ed950d6ea584525a11290ec86ebb12e918ae5d628f95e798796"
  end
  version "2023.6.8-1"
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
