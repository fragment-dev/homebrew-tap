require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4485.0.0-darwin-x64.tar.gz"
    sha256 "df0080c021f52261c07522542ce98eb7cb91265d07f4dba0915946ac5a38a3fc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4485.0.0-darwin-arm64.tar.gz"
      sha256 "0ebdeb82e187db1d574b3f1a46b0a31e877e7cceeb24a5ccecf358539da247a4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4485.0.0-linux-x64.tar.gz"
    sha256 "7b186f01560c7d2894b3c4021c2dc64fcf75f96d8ede28f90635344cef1b5094"
  end
  version "4485.0.0"
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
