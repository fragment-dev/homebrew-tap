require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2962.0.0-darwin-x64.tar.gz"
    sha256 "3ebc96c62267a5b85e5b1177422d7c7b307e01912a7a7984f493e0fdbfa2fec3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2962.0.0-darwin-arm64.tar.gz"
      sha256 "d53ae481f5646aa2501dbd9d6588145d06b78552f1856de301b77fc906d217f1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2962.0.0-linux-x64.tar.gz"
    sha256 "8b0c2f2d06c5c4e42472d5acd864669fe018a4fbb1973aa9506d0f624bcd04a3"
  end
  version "2962.0.0"
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
