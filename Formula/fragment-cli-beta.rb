require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5518.0.0-darwin-x64.tar.gz"
    sha256 "5e0ce20b32741ceff3a6d18b9f1cdc28a936dbf24034e735a2a046f2b1675f61"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5518.0.0-darwin-arm64.tar.gz"
      sha256 "68d99d94e2440b693515f67becc437fbade0eb5ca1c56b89ef6701e0e1a70958"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5518.0.0-linux-x64.tar.gz"
    sha256 "66680a8429a28764a2d4b0e75846e1d0cd05b32c1178ad5e5018363fddd97e27"
  end
  version "5518.0.0"
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
