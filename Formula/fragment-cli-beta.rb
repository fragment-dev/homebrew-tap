require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4018.0.0-darwin-x64.tar.gz"
    sha256 "d1f3606e2fb49e9843a289c468b491cd55a920ce76f007811b8eae4fda4d5d62"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4018.0.0-darwin-arm64.tar.gz"
      sha256 "5b945395f2af6c593704f3ab540c97ff1c03dfaf86a305dce7db51150b895312"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4018.0.0-linux-x64.tar.gz"
    sha256 "a9c6f921e39a50975d2241dc12f97dcb5c41f5fe7304685c1005a0e2e1542d25"
  end
  version "4018.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
