require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5754.0.0-darwin-x64.tar.gz"
    sha256 "fce403ff0e9dd4af42771085f24c00edc6871be109c8d1bd8629cfb13ea48dcb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5754.0.0-darwin-arm64.tar.gz"
      sha256 "689e98a44f9aa7d536198e6841c1f3c32dd534c70db717976cbda081f583ef6e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5754.0.0-linux-x64.tar.gz"
    sha256 "6739ea2bd86caeb7924ad9acf065cc6a7533222869ea10fc035b5e793d683e61"
  end
  version "5754.0.0"
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
