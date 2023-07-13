require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3061.0.0-darwin-x64.tar.gz"
    sha256 "e6c21fe1702857513dcbfece021d0e77a304454fdb1b5408e08b79e1eb5b4ccd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3061.0.0-darwin-arm64.tar.gz"
      sha256 "6d3e646fd8aa526d2fd306f02c208ff4cc9a896a6588054902f6198254a94ce3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3061.0.0-linux-x64.tar.gz"
    sha256 "7fedbbcd203146be5fe896d95c915d2070bd277a9ed8054535e2ff03dfb5d40e"
  end
  version "3061.0.0"
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
