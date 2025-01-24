require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6125.0.0-darwin-x64.tar.gz"
    sha256 "71b60e2f42f618e3a90e79c4ecd3bca8d22f5d33c6c20a290a8f69021a58e775"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6125.0.0-darwin-arm64.tar.gz"
      sha256 "211fb3d03e3aa3b003638e410cd7979f78447f4c4500bd2c2dbe9b2deb19b2ae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6125.0.0-linux-x64.tar.gz"
    sha256 "73c83a42f7214d47c96d235d46ef85b6272f5b9921e0fcb5a455e6cc9c152cba"
  end
  version "6125.0.0"
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
