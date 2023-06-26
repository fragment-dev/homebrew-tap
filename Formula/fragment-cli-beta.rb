require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2926.0.0-darwin-x64.tar.gz"
    sha256 "0f7776a089f3041cb3939fc7f3befaf5da00e9aaa9a1c8faf95cae839f476420"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2926.0.0-darwin-arm64.tar.gz"
      sha256 "5fa9abb9b52e42cc5faf9aa03f80742e292e877300a82e61483e4382bb74f35e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2926.0.0-linux-x64.tar.gz"
    sha256 "4f2011938dd6816e662ce80021476a5d4ec203aa347234ef67c28c395077bdca"
  end
  version "2926.0.0"
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
