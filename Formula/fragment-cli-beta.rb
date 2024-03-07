require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4723.0.0-darwin-x64.tar.gz"
    sha256 "a82c60b2d2db5051d9cae86776692d5628e96465d74d2058aad768326e1aaa7d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4723.0.0-darwin-arm64.tar.gz"
      sha256 "0661943f6c801d9960c58ec88586d72a0928e235941452f1de627a719e47bebf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4723.0.0-linux-x64.tar.gz"
    sha256 "9782261913f12748707a6e64d9216a70feefa3bbc27999dea70387ee56cc3506"
  end
  version "4723.0.0"
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
