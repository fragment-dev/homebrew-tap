require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6142.0.0-darwin-x64.tar.gz"
    sha256 "fe5e227eb3380d60b998aeb8d408000d08843dc0df1d8ca9c286c5271d6ba65a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6142.0.0-darwin-arm64.tar.gz"
      sha256 "bdb2c8d815ec7b35836abe7cdc5d80100e24f46e37110f31ff8f19b868ba6817"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6142.0.0-linux-x64.tar.gz"
    sha256 "33c907c42b3c1c0779215fa1736672a120e53231ae3b10b34a8fa2d917b2f050"
  end
  version "6142.0.0"
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
