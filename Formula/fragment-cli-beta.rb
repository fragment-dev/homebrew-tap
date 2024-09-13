require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5588.0.0-darwin-x64.tar.gz"
    sha256 "20d3df2d91cb44664f4638ed0e34bee246cd47f17746d9b4f901376ab349f408"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5588.0.0-darwin-arm64.tar.gz"
      sha256 "445d09cb300256316a20efd114220afaeb115108e2b68176bb0db43a1032d8bd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5588.0.0-linux-x64.tar.gz"
    sha256 "a7b834508c97e0657a51a167be9f96a0571bae521934d5d3168497787f9f73c0"
  end
  version "5588.0.0"
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
