require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4441.0.0-darwin-x64.tar.gz"
    sha256 "5d9ca5cc912cad873cfb51f1479e405d222d736fdd2aee348d616f6e6327c8f3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4441.0.0-darwin-arm64.tar.gz"
      sha256 "00f66cdcfe666bce2c08c78e7d4b95858354515a168a322121becce45a5f598f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4441.0.0-linux-x64.tar.gz"
    sha256 "4bfe0ca691005f8fe2f692feac411f92d6575b396e8ae9228f7eff70b3a64a4b"
  end
  version "4441.0.0"
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
