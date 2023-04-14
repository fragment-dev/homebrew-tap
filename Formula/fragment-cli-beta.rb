require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2446.0.0-darwin-x64.tar.gz"
    sha256 "405e753965f3bfd1c5736c09ddbd00f7153fdb16c558a7d87d677b4122287750"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2446.0.0-darwin-arm64.tar.gz"
      sha256 "5101c6f2a14dc84e4d5017505d273d225d90adc5b866e981b26976b4cc7da87b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2446.0.0-linux-x64.tar.gz"
    sha256 "900110ec24ae17e9b73dc2e6185fe27b20a3c022d34e8b50d972c02e040c3f3d"
  end
  version "2446.0.0"
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
