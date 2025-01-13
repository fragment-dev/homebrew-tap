require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6076.0.0-darwin-x64.tar.gz"
    sha256 "2936fc2fb2995aa28f0cc362907337a9f54c23c4043a55a6a9a9f2455c4d095c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6076.0.0-darwin-arm64.tar.gz"
      sha256 "f335e4a3b7c3df1be0fedad260853b3718957bfb0c4e9f28067fceca75085c62"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6076.0.0-linux-x64.tar.gz"
    sha256 "53ff3b4a2674d348d25c1a881b258d3f8775bf6fa2fdc0401514112428a02aa6"
  end
  version "6076.0.0"
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
