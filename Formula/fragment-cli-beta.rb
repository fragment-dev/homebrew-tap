require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4253.0.0-darwin-x64.tar.gz"
    sha256 "02e77b38c3fc58e24b2d26e3d44ae3a4bbe27cd224c5b0e1c90041aaf3b4a566"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4253.0.0-darwin-arm64.tar.gz"
      sha256 "018f60e07829a50397ff175da38c27d081f2775cc1ec2823457dde3778c98322"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4253.0.0-linux-x64.tar.gz"
    sha256 "6d074e7bf8d03097f80ba4d1e96f8183329c23132e952e7e7433d6002eb673f3"
  end
  version "4253.0.0"
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
