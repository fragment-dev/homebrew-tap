require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4207.0.0-darwin-x64.tar.gz"
    sha256 "ee1f6419c37ed464c5c980755d87728d2f39221502d8148bd8444a41ce624910"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4207.0.0-darwin-arm64.tar.gz"
      sha256 "6e13afd37a587298435fde2d93fbb8b06ca315786121a4f2c6724e89f6785681"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4207.0.0-linux-x64.tar.gz"
    sha256 "ce282bacd1093e96c3d0718c612dae389ec841089099c384d3baadc60f3481e6"
  end
  version "4207.0.0"
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
