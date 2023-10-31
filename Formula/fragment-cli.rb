require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.31-darwin-x64.tar.gz"
    sha256 "d8f4a411dd58b8c82301b0aa15f3cb020ee534293cb8cadc9b160d1dc6f0df45"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.31-darwin-arm64.tar.gz"
      sha256 "255d8478ba7eea0d6bc9dfc6c7a63734c46cf54fb7abeb78173677c33c5839fb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.31-linux-x64.tar.gz"
    sha256 "766f2eb9486753210972d77bce32986f747c315b1abe1cf9b9915205f8c0008c"
  end
  version "2023.10.31"
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
