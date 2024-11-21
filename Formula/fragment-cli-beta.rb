require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5819.0.0-darwin-x64.tar.gz"
    sha256 "3e2f4d94ee6f537e5465589d568cd7d5615d804a40aa73794dda411799417438"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5819.0.0-darwin-arm64.tar.gz"
      sha256 "99ffd84d352d93f04c38e99e4bec2fa1c03b28c13970c01d23df1ab3d67962d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5819.0.0-linux-x64.tar.gz"
    sha256 "1d58beb425498e23ba7568d0f6f7d0e9dd2f4532caabf3c1d36d801e45566715"
  end
  version "5819.0.0"
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
