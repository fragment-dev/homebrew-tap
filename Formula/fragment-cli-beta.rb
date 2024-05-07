require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5007.0.0-darwin-x64.tar.gz"
    sha256 "77b2f9434157487b09ca866a76e77e75e4d6ad7c8cd39e27a5a7cf520a8db514"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5007.0.0-darwin-arm64.tar.gz"
      sha256 "6a52ab5307deca973038b1d41cfd70e40e6b09c5b4f5a0a436ba1e41ba0faa2d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5007.0.0-linux-x64.tar.gz"
    sha256 "fa1737f24a189f7d1af85a8f3208d76664247d512de33526508306e1ac7bf406"
  end
  version "5007.0.0"
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
