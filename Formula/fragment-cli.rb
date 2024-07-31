require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.31-darwin-x64.tar.gz"
    sha256 "aa1c10fd7b13e929ffcf9769e7ac16c27b54a7095b7f93af102314aa103d5f39"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.31-darwin-arm64.tar.gz"
      sha256 "733ab0dc24fa66ba4c9386773cb17b82e78e5e247666f77dca0ee91fe9ef30dc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.31-linux-x64.tar.gz"
    sha256 "c984c78edd1f1deb1844756c3d2be935118a1bae37b0379502c3eb6067aea17d"
  end
  version "2024.7.31"
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
