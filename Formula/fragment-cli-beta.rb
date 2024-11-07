require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5749.0.0-darwin-x64.tar.gz"
    sha256 "bc004a4f7e43e4c05a8b72a046b5bd0b02b740b6073085236395cec000ea6484"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5749.0.0-darwin-arm64.tar.gz"
      sha256 "93fbe61ae479c8596bc7948305f557365028435e7a2a2a91bc499c37759f4638"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5749.0.0-linux-x64.tar.gz"
    sha256 "d41d9cbf9c3876c31bfa28d805d2da81e9909f96e4fd52f5f7290e1a105c7205"
  end
  version "5749.0.0"
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
