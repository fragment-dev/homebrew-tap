require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5693.0.0-darwin-x64.tar.gz"
    sha256 "975331dab6f1dc48b879f6666e37168d09b0b1ccff9c4b2c37c5f2377ef7c3b5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5693.0.0-darwin-arm64.tar.gz"
      sha256 "605289e41bd7a0d783c05f016d485d10f98e8cf3a4c1a0111a74e04470aab0a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5693.0.0-linux-x64.tar.gz"
    sha256 "e9abbd1b4354c918be8c799f8767bbed4a6274725f4da1d23ee67398a67d786e"
  end
  version "5693.0.0"
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
