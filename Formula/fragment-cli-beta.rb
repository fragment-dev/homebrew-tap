require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4995.0.0-darwin-x64.tar.gz"
    sha256 "b3e67cfa38e7edbf8d348c340c507ca298a2d4dd75e88e39ff981534f1b43929"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4995.0.0-darwin-arm64.tar.gz"
      sha256 "2ce3c5cb239d0e03890fb54193be5ca2e57882ab77d61cf93206e40ccc1c49fe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4995.0.0-linux-x64.tar.gz"
    sha256 "49803653b4df53f2f6a74a1a5b795583b554c072ac9c7bda33706ff37adda877"
  end
  version "4995.0.0"
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
