require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3472.0.0-darwin-x64.tar.gz"
    sha256 "856b94b1b9ad4d7cc4e1999363310aa69bedee272b726f0c189eb60bd9b35abd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3472.0.0-darwin-arm64.tar.gz"
      sha256 "e9656a4fa806b9a75621dc5517530152d8cfa9e4aef1123b56fc368538bd495a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3472.0.0-linux-x64.tar.gz"
    sha256 "75d58e58225a4e27113971f09ac18b4fb1939d2b1ee79febd1a49551b1234509"
  end
  version "3472.0.0"
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
