require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5127.0.0-darwin-x64.tar.gz"
    sha256 "33b81690751f1bfa38ad3f200910e1e07b1a21535d69b553a3cbebbb25615a86"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5127.0.0-darwin-arm64.tar.gz"
      sha256 "177f97b204a70cd2bd1591ab2d9d14cbb9a57550d6f985013df49b8ee4c0ebdc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5127.0.0-linux-x64.tar.gz"
    sha256 "44fe9c38bf6b660a2587d98e1bb067c12d0abd0924d70b40fbbe252e12f51172"
  end
  version "5127.0.0"
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
