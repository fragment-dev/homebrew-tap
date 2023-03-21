require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2253.0.0-darwin-x64.tar.gz"
    sha256 "3b66512c171046f7dc9fcef0a8624cd585181b11a4b98d67f5a91c07a14932af"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2253.0.0-darwin-arm64.tar.gz"
      sha256 "8398e8463d0db85f26bbbc7c1e0c8ab68f2adc854fbae8aca5397f1b67acb4d7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2253.0.0-linux-x64.tar.gz"
    sha256 "c907f868a55abcb703ddc60ee29af5eac88edfad230ba00a28937ea6923b6624"
  end
  version "2253.0.0"
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
