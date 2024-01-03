require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4251.0.0-darwin-x64.tar.gz"
    sha256 "05369218e6a2aba3ec55156ccbdd0c7a46c48a61a32baa997a9f62c89e31257e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4251.0.0-darwin-arm64.tar.gz"
      sha256 "768598c2759484e82caa7a903ab29611709463bfabe2c32f9c0258ef96a01f56"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4251.0.0-linux-x64.tar.gz"
    sha256 "9c9f9133aa4ab100bf349e31ddaf1bc33db9a6acd5f74f1cfebf6bc0ee07cdfb"
  end
  version "4251.0.0"
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
