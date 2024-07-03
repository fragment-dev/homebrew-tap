require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5348.0.0-darwin-x64.tar.gz"
    sha256 "36d9feac9dcb902ce217a86dbe1de811e921382f56ebbf67e9d87354274fc326"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5348.0.0-darwin-arm64.tar.gz"
      sha256 "db373911e79ad51bcd54320142cdd58b2582b886e9843944174cc7ab354cb07d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5348.0.0-linux-x64.tar.gz"
    sha256 "d17527732b51b74f39c2da234da33a6dcfd32baa3c961b382e09d1ebd51b8755"
  end
  version "5348.0.0"
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
