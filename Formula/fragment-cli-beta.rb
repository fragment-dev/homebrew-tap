require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4660.0.0-darwin-x64.tar.gz"
    sha256 "6b78a870b6a5b525eaa469ed5cb52cfd5d1a27d7bed6905f4a177a03c14423fd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4660.0.0-darwin-arm64.tar.gz"
      sha256 "392c13f7efe6ddb5a1a135306a1e3e0517da38622e0af878b5f15754fae5a976"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4660.0.0-linux-x64.tar.gz"
    sha256 "67100f43582e8e5988935615683dfcb14ef7d4355b9ac40c0e6271be2bd7a38a"
  end
  version "4660.0.0"
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
