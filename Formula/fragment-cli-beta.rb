require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3116.0.0-darwin-x64.tar.gz"
    sha256 "37de8ad9f05f3a7b4de9ee13f637682681f6d0d4122882e755b901322ee33d0d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3116.0.0-darwin-arm64.tar.gz"
      sha256 "51f15657ee88bee0ae54c7e16cb5c7a5bde6615fc2a2d63e73f0e78f3734eccd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3116.0.0-linux-x64.tar.gz"
    sha256 "61487e06772412cf8d6a558819618875a0217ee9a0f7d6fb6ca8066a7dad898f"
  end
  version "3116.0.0"
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
