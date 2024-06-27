require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5323.0.0-darwin-x64.tar.gz"
    sha256 "8e882142a133f0eeb19ebdbfc0c96298c1d2a45791ddeb7d9e9a43ea83432086"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5323.0.0-darwin-arm64.tar.gz"
      sha256 "bd99ba3e540c19e1d1b1ce31788f479a061a8025b2ec6f81af059b343514c500"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5323.0.0-linux-x64.tar.gz"
    sha256 "210d0c242703ac8950a84036c1319d97bfa8dfd0507a542ae0500b5d61d4008e"
  end
  version "5323.0.0"
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
