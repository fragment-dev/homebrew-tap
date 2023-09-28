require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3691.0.0-darwin-x64.tar.gz"
    sha256 "29bf5bc4cc1d415536ce8bb646e516af0cdb385f9729b970a3d5f9a7272b8f76"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3691.0.0-darwin-arm64.tar.gz"
      sha256 "2f1816d802789c8518e1a5ae0ba51a670a0cfeec7f6f5e59f871f48c711928aa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3691.0.0-linux-x64.tar.gz"
    sha256 "9d9f04b13f91cc19a39d40c0ef16cc1f2a4666127533ed81c6d84f8406869a8f"
  end
  version "3691.0.0"
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
