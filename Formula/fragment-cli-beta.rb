require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5036.0.0-darwin-x64.tar.gz"
    sha256 "9eb050a098c031ea055f4429c9fb38751366b3c4f967fa983a3390c423c80079"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5036.0.0-darwin-arm64.tar.gz"
      sha256 "421d2167217d92a875523a7751dc6a6d168d8fe7b52f15e5b8af149b67535e80"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5036.0.0-linux-x64.tar.gz"
    sha256 "b6b416f71cfae11c5ac50a3716be3a127b0fcba00ccebd0621337f200f8c837c"
  end
  version "5036.0.0"
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
