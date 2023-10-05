require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3768.0.0-darwin-x64.tar.gz"
    sha256 "fc940ad1d9160635696ae04e713c4f1915239adf8170e83e6b8fe40b126d473d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3768.0.0-darwin-arm64.tar.gz"
      sha256 "ff60b2361fee4c851e6b0c545dbf8852cc34f3916a48cd66950793298d731a5e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3768.0.0-linux-x64.tar.gz"
    sha256 "73518f2d456d787ef6cca2c11fbf032282c43dd370e2348ac1cc3706a49e627a"
  end
  version "3768.0.0"
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
