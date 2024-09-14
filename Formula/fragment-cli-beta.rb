require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5590.0.0-darwin-x64.tar.gz"
    sha256 "f2615ce0dc076bab128687526e182dd621c3453f89b0f116358ca7680c8c0220"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5590.0.0-darwin-arm64.tar.gz"
      sha256 "398727468fc856724227ac78ea1d86b65b0bd767f41f3e7b61067ca7b6b1ccbb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5590.0.0-linux-x64.tar.gz"
    sha256 "a078dc864b41b3d47bf763e91dcc18ddc1cd1f1e1ac904bb38fc682f286f4646"
  end
  version "5590.0.0"
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
