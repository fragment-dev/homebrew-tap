require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6391.0.0-darwin-x64.tar.gz"
    sha256 "5a847f53e8e50bcc3ab7035d35cf832af43b4a87bd9e5474445239e9cdb94690"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6391.0.0-darwin-arm64.tar.gz"
      sha256 "ec6593a79a8fe249e3ca0c06e424421aed0b1d40ddcab4fc1fc8d38dfca9b31a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6391.0.0-linux-x64.tar.gz"
    sha256 "1a7788f5c1e668003c8db69f781768c6bd23157da62140075986b79a9d903ed8"
  end
  version "6391.0.0"
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
