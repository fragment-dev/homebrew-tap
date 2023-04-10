require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2400.0.0-darwin-x64.tar.gz"
    sha256 "90c2aff9b84822f69dea47f2f867f7d3db9a77746315c93a916db9d8b8fcf139"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2400.0.0-darwin-arm64.tar.gz"
      sha256 "81266f751a36dbea6d997e211f811f6b858f3fa3c4df62be627ccd24c975bb53"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2400.0.0-linux-x64.tar.gz"
    sha256 "f73ce73412f51b674800bf7e9d409ee3d613f5dd98b63bfca475723d451cbb17"
  end
  version "2400.0.0"
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
