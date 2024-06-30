require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5329.0.0-darwin-x64.tar.gz"
    sha256 "8742f24204cb64fabbda50a3c2c2787d197119fba6b2a64ec1aba10e53e45ef0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5329.0.0-darwin-arm64.tar.gz"
      sha256 "a18dd621a105d91a234b0c90a0600b392b86452b3f1f2321e817e203cd4c3cc7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5329.0.0-linux-x64.tar.gz"
    sha256 "6f1acb4cc8d91ea38b43720fcb51d67046415e7e7e690111b0084a51b8f0768c"
  end
  version "5329.0.0"
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
