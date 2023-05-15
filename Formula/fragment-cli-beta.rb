require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2663.0.0-darwin-x64.tar.gz"
    sha256 "3895ceb51021e2c01901021efab96b0f8332507cbfa71afde1e1b9c9f1562883"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2663.0.0-darwin-arm64.tar.gz"
      sha256 "ee716745ceb864348d8d2a1f1a495f30d58785489e49c25ca7230c8757856fe3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2663.0.0-linux-x64.tar.gz"
    sha256 "c3e56a560c4b5eae917e8d02a08ddcceb4a9f6102b8ab346ecbf11dc929f6482"
  end
  version "2663.0.0"
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
