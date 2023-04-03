require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2342.0.0-darwin-x64.tar.gz"
    sha256 "a378a328f1b3b97d2f9637471fec66bfc2aa112a3abc9d33407fa2a2a4d474aa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2342.0.0-darwin-arm64.tar.gz"
      sha256 "21832cff095629a954484174217039c9c69e650df2d4ebce925ebe6be1953398"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2342.0.0-linux-x64.tar.gz"
    sha256 "c5461ed9c5b5b90d8f3a38e870c01a1c0fd0b562f165bd0393631fcaa12d7ab3"
  end
  version "2342.0.0"
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
