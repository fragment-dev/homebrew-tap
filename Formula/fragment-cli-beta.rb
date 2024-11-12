require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5761.0.0-darwin-x64.tar.gz"
    sha256 "a36a048f16397c19c0e8bd3fd8925d18c2745e5ac6da065affb4f2943a29ff20"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5761.0.0-darwin-arm64.tar.gz"
      sha256 "a6d6b368e9b3be2512119ff9e6ac82721fc552efa917d530e1455b9a0d7db814"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5761.0.0-linux-x64.tar.gz"
    sha256 "1e213279e3769d00653962aa51eca8fa7658e2a5da03b567e87c179c6bb05153"
  end
  version "5761.0.0"
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
