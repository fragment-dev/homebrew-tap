require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5595.0.0-darwin-x64.tar.gz"
    sha256 "92d2d052cccc460d2c25cda2f6b2404d8a80ef0520edee1f6d3490f0b6837103"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5595.0.0-darwin-arm64.tar.gz"
      sha256 "6a522b0ee2623d2dfdd04a417570a4d5d565595f2e7214cce4766a60f372bc69"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5595.0.0-linux-x64.tar.gz"
    sha256 "3d02de8d751a1d831b3b15d4e91374158b49eeda2dba733e9f8b9e9d68bea470"
  end
  version "5595.0.0"
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
