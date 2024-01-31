require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.30-1-darwin-x64.tar.gz"
    sha256 "5c621df46ddde71b53a8512e850922eb1c05b584da08b80778533c3a68e6251d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.30-1-darwin-arm64.tar.gz"
      sha256 "d18fd3ffd8dc71eefb6985ca83d0ffc41c055716cca5f75d8764373fb1883ddb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.30-1-linux-x64.tar.gz"
    sha256 "0c950f57e8648f3cd6b860a80f74728e8ea65acf99040c653cee401a23864118"
  end
  version "2024.1.30-1"
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
