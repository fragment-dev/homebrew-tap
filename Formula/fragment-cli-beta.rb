require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4538.0.0-darwin-x64.tar.gz"
    sha256 "57db5119616743e12af0f84a0477e73bca0efb098b9d10e115daedbaf34a0aa5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4538.0.0-darwin-arm64.tar.gz"
      sha256 "c10e820943c21c6de19da56dbf17b05b1ffc884c6021bba649d8e1e10f3d09da"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4538.0.0-linux-x64.tar.gz"
    sha256 "a1ade797a83d5ad0eac6e6bd5aede3a56c3fa25e69d12e764912eb37c4147e08"
  end
  version "4538.0.0"
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
