require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3649.0.0-darwin-x64.tar.gz"
    sha256 "cb53f84e6247f2d17fd8459d41ffaaffd88c9f34b60f2f378f26889b214aadb7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3649.0.0-darwin-arm64.tar.gz"
      sha256 "b1d5e794aa96febf923bea2fd4a12fd09fc8a03d0d2ce321dc50cb63947417d2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3649.0.0-linux-x64.tar.gz"
    sha256 "db994799150e4a82074f3cc5bda0366f7fa9e4e8a7d50ef4e3edc5307c3065b8"
  end
  version "3649.0.0"
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
