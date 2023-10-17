require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3838.0.0-darwin-x64.tar.gz"
    sha256 "9687f177c01c1e74a8289a97d59de06d2c7bbaf1d42b3a071162fa5bc2940d0a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3838.0.0-darwin-arm64.tar.gz"
      sha256 "a29c402d7016f26065d31083ebca00bfbff48787ca69dd4d84743bd0b1772ab7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3838.0.0-linux-x64.tar.gz"
    sha256 "e0f52a466c565bbbc28c295dce5ef4a7cb1721d531fb76ecd907a81ddb74c060"
  end
  version "3838.0.0"
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
