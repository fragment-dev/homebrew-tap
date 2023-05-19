require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2700.0.0-darwin-x64.tar.gz"
    sha256 "8fa691759f7bbb851e40d4047d6d01ffa3284a0697c4477a38ba4563faabaeb2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2700.0.0-darwin-arm64.tar.gz"
      sha256 "51444f84c523601f196d2b89c3f57bb2f50d709d3f8f193d545f3b037db939ec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2700.0.0-linux-x64.tar.gz"
    sha256 "09e20feae650f656b42b55f7a5cf73d16700feec513b75716e7690b0700e48a0"
  end
  version "2700.0.0"
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
