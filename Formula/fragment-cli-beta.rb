require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5532.0.0-darwin-x64.tar.gz"
    sha256 "b6d4c5f297bdea6c2e5022e38d6bfb4cfa265b0f67aed8b6747a694ab8e4756c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5532.0.0-darwin-arm64.tar.gz"
      sha256 "149331f554ed1959f9d37864f8c2618eaf39ce4d497b309e9dd0a8391b9664e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5532.0.0-linux-x64.tar.gz"
    sha256 "8b0212a51d22058e4456544f00e7642e997e4df6903581160328118b2d8cb253"
  end
  version "5532.0.0"
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
