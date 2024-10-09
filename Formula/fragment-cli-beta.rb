require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5653.0.0-darwin-x64.tar.gz"
    sha256 "8ac2d24786583e2a304724b4f69434fa80b5a38cf7f102d97fbb3519b0c85c7d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5653.0.0-darwin-arm64.tar.gz"
      sha256 "b07c22ed7f100689110b45ca7c6467327ac1036c881484745652befd85760b4f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5653.0.0-linux-x64.tar.gz"
    sha256 "c85a9a5a6602924729d4000c5eb643b3ca5141d7f4336cd6a30f6b9d81a9eebe"
  end
  version "5653.0.0"
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
