require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4541.0.0-darwin-x64.tar.gz"
    sha256 "b218b823ee851fd3ca83471a84c61c33ef456da50399a8516c08ec72b47a5f4a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4541.0.0-darwin-arm64.tar.gz"
      sha256 "375983aa8b26dc3f5994ed5bc4e048bd8083fba717ccaf10bbef6ec527728528"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4541.0.0-linux-x64.tar.gz"
    sha256 "53c3e1bd47e40a96fa6855713bb3bc7d5576e86eea88c3ae1dbef0452b118803"
  end
  version "4541.0.0"
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
