require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3983.0.0-darwin-x64.tar.gz"
    sha256 "39346c623dd980884b8093cf6ec094e87e0987a7ed6459d088a0e683f0d85be8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3983.0.0-darwin-arm64.tar.gz"
      sha256 "bcf91dfd6f57e72a12cf742254b5f14b8aacbc8a586a54b3285afeb213b7d8d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3983.0.0-linux-x64.tar.gz"
    sha256 "f0f42a64be97eb9c675e2634802a34516c3d2edd2104c64558d12133d9958249"
  end
  version "3983.0.0"
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
