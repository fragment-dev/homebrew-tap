require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4592.0.0-darwin-x64.tar.gz"
    sha256 "f1362f39b93b66aed8fe0ce4d00aa826c425c48196a18556e35bca1b046cb187"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4592.0.0-darwin-arm64.tar.gz"
      sha256 "30f5d08c21d3368995a901b0221bd4b35b4abda4d453dab243569326cdd6048b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4592.0.0-linux-x64.tar.gz"
    sha256 "87d1c32fbe724ad7f6dd8f3efa15ed25fe62d0d9dc4cb9c719aa9b158ee0c994"
  end
  version "4592.0.0"
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
