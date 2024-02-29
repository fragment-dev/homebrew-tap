require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4669.0.0-darwin-x64.tar.gz"
    sha256 "070f6a6bc9fa3a23ccc7c18260347a2168842d78af193eb141a073134d1508cd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4669.0.0-darwin-arm64.tar.gz"
      sha256 "c94576a7ef7f665df56dac3f240103c56c3cfa9a934b21726f2c465df9b245a4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4669.0.0-linux-x64.tar.gz"
    sha256 "d993eb36f3f650a8ceff596f2a4ea8c1a99c2ccd7a846f6880a106e9dbbfb28b"
  end
  version "4669.0.0"
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
