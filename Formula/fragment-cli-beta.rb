require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5631.0.0-darwin-x64.tar.gz"
    sha256 "871d126e89cf06963e2890987f40f7e7e8976f1dc5f7f9f969255141fc32ffd5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5631.0.0-darwin-arm64.tar.gz"
      sha256 "4b347e63081bf9e5edb8d3f3a836234ec368680ea99e0eb6c6fa7c6f49463643"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5631.0.0-linux-x64.tar.gz"
    sha256 "38221f7995e7c3f0b0515adec3b56bbab5292cf7384b800d5b4001ce461dd491"
  end
  version "5631.0.0"
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
