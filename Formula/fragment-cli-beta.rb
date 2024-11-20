require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5804.0.0-darwin-x64.tar.gz"
    sha256 "ab45ac65ea262ce17f0f5d038a3ea1701deedb4232ede562748b76db9b1330ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5804.0.0-darwin-arm64.tar.gz"
      sha256 "61a470545e07fd884c06767d151ce156242fa3834e0fa6bbed4d993ac3e21850"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5804.0.0-linux-x64.tar.gz"
    sha256 "f8dbdb48d1b6da8f842c369cf299b5b8fbc157abf77260974036ed5beeaa795f"
  end
  version "5804.0.0"
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
