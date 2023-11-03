require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3968.0.0-darwin-x64.tar.gz"
    sha256 "1ab1bbd07a13c1bf71ab4e83a4438a554f58fc9d6414b1281a483a9d7173f45d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3968.0.0-darwin-arm64.tar.gz"
      sha256 "13baf6e83140cdf17c2f488e5f858848d4a0dd250a200c8b6cbd8049635c9340"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3968.0.0-linux-x64.tar.gz"
    sha256 "26184aaccf0821865c9795cdf6c1a9e0fa1ffa66c8150188a5c40f94f9b7fa95"
  end
  version "3968.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
