require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.31-1-darwin-x64.tar.gz"
    sha256 "e3183546daa8cc755aacf57c8a6bf524d2f9f08ebfb0fd35ebbf6f80db91791f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.31-1-darwin-arm64.tar.gz"
      sha256 "38591eb32767e2d62d1745181686b4395bf7579d2bfdce27fa24a5a0dc1ccf5c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.31-1-linux-x64.tar.gz"
    sha256 "9e4cb6365fbbd1a52e3a2e5f53db6b1c6b6fc4e3380e9193a56d963e9b534929"
  end
  version "2023.7.31-1"
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
