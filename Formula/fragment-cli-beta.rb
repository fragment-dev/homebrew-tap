require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4785.0.0-darwin-x64.tar.gz"
    sha256 "523224850d2513760520e5e94f56410c20bc1657844cce2a9185b06e943852d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4785.0.0-darwin-arm64.tar.gz"
      sha256 "7d26b007320ba069f6a95bcc90b68fc0157b575aae410a55ea260f10d885c577"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4785.0.0-linux-x64.tar.gz"
    sha256 "ea54cfb09b2a8cdaa688519dca782c43bc8c52b9fbe146f444544444bf04c57f"
  end
  version "4785.0.0"
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
