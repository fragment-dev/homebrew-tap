require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5897.0.0-darwin-x64.tar.gz"
    sha256 "3e831a7bb741420722445d0c63296576bb34f0d40729140d82b0e2041e46af50"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5897.0.0-darwin-arm64.tar.gz"
      sha256 "1574c5b17711112b96144313904601be4372f6f2616c20f349271d8f914aaff3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5897.0.0-linux-x64.tar.gz"
    sha256 "9fbfd3dd907c85cfa3c372bf2b3482bd5cf9b51b65348c43dfc3bb6d80fb9b18"
  end
  version "5897.0.0"
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
