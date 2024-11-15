require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5771.0.0-darwin-x64.tar.gz"
    sha256 "b7693fc09aa420ee87e9789051046104fa7b704ffda162036b7659e45ea7a100"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5771.0.0-darwin-arm64.tar.gz"
      sha256 "6687be0871680668cd397824dcb68fab94484f23676d86ff08fd5a5a9d38847b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5771.0.0-linux-x64.tar.gz"
    sha256 "c5393d06d8d3a9fd215e354abc9f30294184efe33cf6b8b15e5199d7d75a16bb"
  end
  version "5771.0.0"
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
