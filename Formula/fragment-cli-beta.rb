require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5994.0.0-darwin-x64.tar.gz"
    sha256 "3ac1fc8e3f46f5fdcb36835557ff8fd853d3b2b6cea1e57b0d65bf6af03e73c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5994.0.0-darwin-arm64.tar.gz"
      sha256 "205d5827d78ab574cfe055c27c8a495f73639b626e91ec5ce06fb34f89b03985"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5994.0.0-linux-x64.tar.gz"
    sha256 "259e48b6563be7d1401f577a98cbfddb9257b23f802332dd5c882f055b6eb9ef"
  end
  version "5994.0.0"
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
