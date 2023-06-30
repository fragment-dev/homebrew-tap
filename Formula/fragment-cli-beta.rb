require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2987.0.0-darwin-x64.tar.gz"
    sha256 "1f5e1fb43f97521a6e1acac6be469f89ea95feadc44043542509ddc36eb60b78"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2987.0.0-darwin-arm64.tar.gz"
      sha256 "789cb8da6f7658cf2b541d182fd5c383dcd3630979afe2f94cbcc4c50fe60913"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2987.0.0-linux-x64.tar.gz"
    sha256 "5d40c309650f12d9e81a78bf6fc79717de7c292a4127a8e713f05e66dc26d704"
  end
  version "2987.0.0"
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
