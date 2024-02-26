require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4638.0.0-darwin-x64.tar.gz"
    sha256 "9d591360e5e5d3124955f87f44439a3b55baeaea968ea4a11ac194219966c12c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4638.0.0-darwin-arm64.tar.gz"
      sha256 "f912003cbd4cba9dcd7f4d9e1127075078439ee4120a46158dc3bf0e19e26a7a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4638.0.0-linux-x64.tar.gz"
    sha256 "ef7029f05f63a49c4fa47145dbad87542c23b8268e3b48b66c62d20b0b6828c3"
  end
  version "4638.0.0"
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
