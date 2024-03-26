require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4813.0.0-darwin-x64.tar.gz"
    sha256 "518ae044f189c852cba5c09302f3e39a4d713bed8ac81739e2226343896cfdbf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4813.0.0-darwin-arm64.tar.gz"
      sha256 "0392a8207a6ec7f01895fe07db67c80af03a03ec29108bc48957e0b75138b98f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4813.0.0-linux-x64.tar.gz"
    sha256 "7c57e6f26f75ea6c386b7d75a562e65bf230f87e4408e941fe27de514c5b259a"
  end
  version "4813.0.0"
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
