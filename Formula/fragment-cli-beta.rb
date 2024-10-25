require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5705.0.0-darwin-x64.tar.gz"
    sha256 "c0b8510c848a60aa676ea0f8d992259b1880bd753f9da7afbba7f481fccf7b49"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5705.0.0-darwin-arm64.tar.gz"
      sha256 "a867de4db0a2fdd90c60493323547285f5f283f8d2a9f44045f4c100a6bb1106"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5705.0.0-linux-x64.tar.gz"
    sha256 "d197ac41b8ca365718125f23f6cc01259d9945a0d2820275ea6e6df7a90d1616"
  end
  version "5705.0.0"
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
