require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5567.0.0-darwin-x64.tar.gz"
    sha256 "587e0872347c58f586c4fa9efab264350fe5d8cc0662e6f3c2f12bd1acc9c8e8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5567.0.0-darwin-arm64.tar.gz"
      sha256 "4a3449e048cafab22fb329f3dafc300b3f63f2ce44a5d06c99ec7f4712ce084b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5567.0.0-linux-x64.tar.gz"
    sha256 "6d120647c714d3bd5fe0e53534723927caf7252baa939aa5b545d2db50652c59"
  end
  version "5567.0.0"
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
