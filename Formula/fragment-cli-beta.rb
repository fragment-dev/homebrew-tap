require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4025.0.0-darwin-x64.tar.gz"
    sha256 "781a621bbab6f5267963bf312dc657eb90b5adee32024cf24cbc4563d99ba325"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4025.0.0-darwin-arm64.tar.gz"
      sha256 "128e7b96b9618b77b8669d9015bbb7ca35f463cc1c24ed412f45a6974f7d12bc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4025.0.0-linux-x64.tar.gz"
    sha256 "33db137654fb9e730a2ad10ccda3c5fc95cd9d8f69ac589f1f7bf631a494c133"
  end
  version "4025.0.0"
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
