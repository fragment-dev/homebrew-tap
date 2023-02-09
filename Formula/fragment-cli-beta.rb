require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1969.0.0-darwin-x64.tar.gz"
    sha256 "8962f4ec40aa486ffe7acda351ad970a22a8813ed1636b9199ee4f673a39bbd9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1969.0.0-darwin-arm64.tar.gz"
      sha256 "3bd96d0c07e3c43e3a12eccafe0fcaba57ed9e40eaa8289cfa33892b0b3b20a5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1969.0.0-linux-x64.tar.gz"
    sha256 "1f3b29231700018bc1884bee1d6ed03294a6b61f3dd3fe7c340dbaa40325a8c0"
  end
  version "1969.0.0"
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
