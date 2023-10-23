require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3877.0.0-darwin-x64.tar.gz"
    sha256 "3105791307260da2007e3a25240117237f484151ae403d37178c7492e72f6d34"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3877.0.0-darwin-arm64.tar.gz"
      sha256 "94e8d058e7a608f0d96bac74a1a197c17e07853a06a0db8270c2c31d4462c460"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3877.0.0-linux-x64.tar.gz"
    sha256 "72222aa53dfbe69d5022473b26f9fd69f2dbd2301aaba73397bbb1f3f645cfb6"
  end
  version "3877.0.0"
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
