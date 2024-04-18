require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4921.0.0-darwin-x64.tar.gz"
    sha256 "688b49b204f6fe21549a03be249d85fb044ed76a579ccbb3717fa046f8fbbb21"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4921.0.0-darwin-arm64.tar.gz"
      sha256 "ab1cd091035db7cce45c179334fa03f2ad8f9efca3c88b00bc7a48327041e6af"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4921.0.0-linux-x64.tar.gz"
    sha256 "e6a05626b88b0633205e645ed9c81a3e99d2ea1fa52862649cca4d1da615df0d"
  end
  version "4921.0.0"
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
