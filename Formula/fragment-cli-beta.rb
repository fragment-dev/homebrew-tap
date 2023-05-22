require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2716.0.0-darwin-x64.tar.gz"
    sha256 "44226551f7f5a060da86af1f23b015dcf2c51383494f39bedcdd3ca4a85be9e5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2716.0.0-darwin-arm64.tar.gz"
      sha256 "415f5f79326e03be4db2df49ae004b7a6ce44c16076723de1b44b4c1c4b883a9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2716.0.0-linux-x64.tar.gz"
    sha256 "332d404f94a8686ce0e551fb8d130a70e7d1bd3bbe9b4ee81dc5e1e0131fb7b3"
  end
  version "2716.0.0"
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
