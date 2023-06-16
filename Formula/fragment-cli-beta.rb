require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2866.0.0-darwin-x64.tar.gz"
    sha256 "81928b475f8cb6c4c059bc23c2a24f8e22e99b6aecaa3f6a5a19d8b15d8c1549"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2866.0.0-darwin-arm64.tar.gz"
      sha256 "54155fd2d85ec4a1729cf77df4cd24466dbfcfb314faa117e2322448f22f055a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2866.0.0-linux-x64.tar.gz"
    sha256 "aed1271e4c15768216086265a4455641597aef708fb7a05c046168f09695eb72"
  end
  version "2866.0.0"
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
