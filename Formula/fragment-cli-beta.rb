require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4445.0.0-darwin-x64.tar.gz"
    sha256 "e8133a0d0dc68d2e2d031f0fe699e02afdbe10dc70b25496a621b418613da919"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4445.0.0-darwin-arm64.tar.gz"
      sha256 "b2d9ba54195db90696f4a59d1318b901f3a12f281a5d1496353e6c6de8727c1a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4445.0.0-linux-x64.tar.gz"
    sha256 "7eebfc16ec9b8244f914b2a071ba770dfd20312b2d340e0127d1c35494009d17"
  end
  version "4445.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
