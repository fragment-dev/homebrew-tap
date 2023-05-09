require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2610.0.0-darwin-x64.tar.gz"
    sha256 "42972fd8e0e07e2f5a25f64ab9b15476fd2507768785582fc23c88ea74cef567"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2610.0.0-darwin-arm64.tar.gz"
      sha256 "3161b13f9989819a1806b1319cf8712d951a4a4b2af9e48d562cf977f4104dc7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2610.0.0-linux-x64.tar.gz"
    sha256 "32a067fbcbfd99895bacf98a05f91a9cd990da67ff6512c05be39e95bad31154"
  end
  version "2610.0.0"
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
