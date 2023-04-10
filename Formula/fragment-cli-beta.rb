require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2395.0.0-darwin-x64.tar.gz"
    sha256 "e202ca568286856caade777e46ea41e1e74abc320be28205f056156f4e58a361"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2395.0.0-darwin-arm64.tar.gz"
      sha256 "cf73c7f33d2e78c9036749061b0478955447a63b0522d04fb241eead5a92b669"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2395.0.0-linux-x64.tar.gz"
    sha256 "915bdcf8f6612bb318af6a920c88289f36ce962451d8fa3fa7704170e6d74c98"
  end
  version "2395.0.0"
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
