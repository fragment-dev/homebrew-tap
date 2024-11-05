require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5729.0.0-darwin-x64.tar.gz"
    sha256 "b51d995883f8c6810a8f59c453e0d2279a88e6855a1cc79da4ec88e10712bbdf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5729.0.0-darwin-arm64.tar.gz"
      sha256 "29bd110de9881a0318316ea6150ca4f60028a38a98b60b729ff60d5fc2183f5a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5729.0.0-linux-x64.tar.gz"
    sha256 "a494127dd2ad1b97c4c58629ef94e10ba6974a6e0cae969fee931539d18e84c0"
  end
  version "5729.0.0"
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
