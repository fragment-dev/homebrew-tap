require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2794.0.0-darwin-x64.tar.gz"
    sha256 "db5b56095f425e6d8b8fd4d0aafe007282aebc664b970a0ea24a1ed4039e1f7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2794.0.0-darwin-arm64.tar.gz"
      sha256 "9a22e58a25d4807abc41849af80a4dc4eaa2179aaacbe1e77c07040eaa75c251"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2794.0.0-linux-x64.tar.gz"
    sha256 "c584040a337077f991522e6b893727e7a5b216ce0234a684b5f9538e67b5f630"
  end
  version "2794.0.0"
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
