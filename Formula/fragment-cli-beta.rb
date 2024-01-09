require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4295.0.0-darwin-x64.tar.gz"
    sha256 "b338b0850b70ed78f61251e117a0c0929f59721fac0321d3e33fe60b01a70d70"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4295.0.0-darwin-arm64.tar.gz"
      sha256 "e76cb6d9a53b11dc2f670ac360e94927de77ac0d6a38c846fd0f464d642dc214"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4295.0.0-linux-x64.tar.gz"
    sha256 "c01fdf2f3642922437bccd4f0d8d389dcf596ac3ff258614eb001175cb454d6a"
  end
  version "4295.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
