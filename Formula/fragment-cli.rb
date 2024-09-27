require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.26-darwin-x64.tar.gz"
    sha256 "ec03fe4aa0ce88775cdfcd0e8fc793bd5d30b15e5ab52001620d4f6b08bef4ed"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.26-darwin-arm64.tar.gz"
      sha256 "538e3e32529ea3ce7ce448e628d8a138a4edc4699967a463a60064b23d327da9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.26-linux-x64.tar.gz"
    sha256 "fad7cf1ff760403c6bd2501bd69d9033069a2f6805a150928b435682b52cd251"
  end
  version "2024.9.26"
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
