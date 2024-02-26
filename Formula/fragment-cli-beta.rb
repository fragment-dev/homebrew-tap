require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4639.0.0-darwin-x64.tar.gz"
    sha256 "5b1510ff4c88bb384fcbc1f8001e322a6a2573e2f2c9236126e760437996e464"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4639.0.0-darwin-arm64.tar.gz"
      sha256 "395ca597f10233807057b0b761a840187493a6a66808786fa8ee5bd89a82ca4e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4639.0.0-linux-x64.tar.gz"
    sha256 "0a1851993024c0ea68079712bfba670d36bce12b63af99ebad21f38e5dc5727b"
  end
  version "4639.0.0"
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
