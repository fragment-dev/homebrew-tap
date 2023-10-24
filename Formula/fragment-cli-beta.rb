require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3886.0.0-darwin-x64.tar.gz"
    sha256 "af9e8a0cbc8f5843517b170fb040d2d6f8d46c9ffc39a9e1ff5b039b3b97b114"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3886.0.0-darwin-arm64.tar.gz"
      sha256 "b5c092212e3297d9e5defb8b55807ad4bc686c3c5c2d56a9fd4523a08d34d790"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3886.0.0-linux-x64.tar.gz"
    sha256 "d83f600151597f63cae91adfe13bdb0b10faa044b07751db14ff3b92327f4014"
  end
  version "3886.0.0"
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
