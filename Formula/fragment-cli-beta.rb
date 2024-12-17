require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5905.0.0-darwin-x64.tar.gz"
    sha256 "51686f2bfe63a87f92514e4e9a34b0ad23be6ff58b68e404b2c793c315cb22db"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5905.0.0-darwin-arm64.tar.gz"
      sha256 "64af5902940a5c6856bf897325be12c999d4d2fc78936af29814c48c227098d7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5905.0.0-linux-x64.tar.gz"
    sha256 "73d14b82597e8c4195cf87b18d0db59cbefbc6dd402840b14833e8fbbe924409"
  end
  version "5905.0.0"
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
