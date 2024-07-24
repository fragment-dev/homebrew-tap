require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.24-darwin-x64.tar.gz"
    sha256 "939dfa11e7759c71d4b5af8706f073dd34254a5a011794a9ceff20f07c6b16bf"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.24-darwin-arm64.tar.gz"
      sha256 "2bd2bb896412c4dc92f2b6b57929b6744d1220a9c1f240325f03848ee03649fb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.24-linux-x64.tar.gz"
    sha256 "9411984f69849cdd0d1346cd4e6dd433e246a1ab471bbe395d6226d1789f706e"
  end
  version "2024.7.24"
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
