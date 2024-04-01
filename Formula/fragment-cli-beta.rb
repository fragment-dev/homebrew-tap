require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4828.0.0-darwin-x64.tar.gz"
    sha256 "6a0bd8e69172289e9af8ab57ed8879b82ebcd87ef79576baae0fee9c6b04e3c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4828.0.0-darwin-arm64.tar.gz"
      sha256 "a0ba311c6c2fd1c9d0d538586497153d6eba3b76a543fecd516e1b75b5b1d0c0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4828.0.0-linux-x64.tar.gz"
    sha256 "bc0cef4e9e842e99db8f7052832743e25c0a97292c08828c97947ee520c1a2b0"
  end
  version "4828.0.0"
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
