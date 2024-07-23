require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5434.0.0-darwin-x64.tar.gz"
    sha256 "302148ef8035238b441cde11d2edd5059ab7e5be10cc14d85ed3f4e0a63f8798"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5434.0.0-darwin-arm64.tar.gz"
      sha256 "e45aa31baf3d4bfb8fd9d06e397b5e98051dbdc86ec5353939d63512aa270cf5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5434.0.0-linux-x64.tar.gz"
    sha256 "169e97dacf03673baadc88d64c5044b8035ead1ca2184dc2590722aa210b47b6"
  end
  version "5434.0.0"
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
