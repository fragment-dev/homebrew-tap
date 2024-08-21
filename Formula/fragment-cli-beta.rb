require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5527.0.0-darwin-x64.tar.gz"
    sha256 "5e29017925de1647d51e19fdb30a8812b8d4724a1b4401aefc85f92f7c93d323"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5527.0.0-darwin-arm64.tar.gz"
      sha256 "99663df915c801504aba4167821fcc9121390c95426af7831401469f933b72de"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5527.0.0-linux-x64.tar.gz"
    sha256 "a16f90061bf1d17e23d387713cc708a561461ede33881c0f3b7612f2167e4ef0"
  end
  version "5527.0.0"
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
