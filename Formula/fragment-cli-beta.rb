require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2819.0.0-darwin-x64.tar.gz"
    sha256 "fbcaa4c0fb61af042ac857f28a8649201e0a115e09610117ff02674a7c317796"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2819.0.0-darwin-arm64.tar.gz"
      sha256 "96e0c98d793aa781693bbfabc5328f14de46cffbaf220a75fef0d330c08e6201"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2819.0.0-linux-x64.tar.gz"
    sha256 "4cf87ef42c5fbeea07019c654c2f3ebd0c0300f6209be1d34297031ffdd31056"
  end
  version "2819.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
