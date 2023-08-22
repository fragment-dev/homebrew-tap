require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3357.0.0-darwin-x64.tar.gz"
    sha256 "edf27eb2ebaa3bf743c131d887d2e08a2811c9fdef56a2e961f55395a3b74540"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3357.0.0-darwin-arm64.tar.gz"
      sha256 "7c640a264b3bc57b4cac6cb76d1d369bc3104e2fe7fa60c7bbb2736f1f0aab8d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3357.0.0-linux-x64.tar.gz"
    sha256 "825dc228537aa6e12bf842d1b393afeb02c625a6cacfaf0b145f463f56330656"
  end
  version "3357.0.0"
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
