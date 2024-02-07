require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4514.0.0-darwin-x64.tar.gz"
    sha256 "c2d7333beab2787a5ef6c2cfc6a01699fbbd70d381714a2a6faede0ec78594b6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4514.0.0-darwin-arm64.tar.gz"
      sha256 "67f5d3f3f6e13d43043dfe7c838bd1c6ea28b8121b4813066d76d6ee107e7e4f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4514.0.0-linux-x64.tar.gz"
    sha256 "f83c6f40cdcb0addeaf8acee1594cfba5b6491b0275efcf46500f8e3290acef7"
  end
  version "4514.0.0"
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
