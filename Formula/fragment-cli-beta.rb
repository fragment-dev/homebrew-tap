require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5209.0.0-darwin-x64.tar.gz"
    sha256 "edf4c670bf7b2db7130b8b2298bd3e9c1d883d8efea61bd7beab52cbe5a8e63e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5209.0.0-darwin-arm64.tar.gz"
      sha256 "7c4923756ee1e1668f2b114219ef0c32439266ea6c9a398879ba636d95a88945"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5209.0.0-linux-x64.tar.gz"
    sha256 "5fff6e4723c81519148412f1adba8dddca816a01051fcd3df96eab09518608c1"
  end
  version "5209.0.0"
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
