require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5626.0.0-darwin-x64.tar.gz"
    sha256 "77630fb7829a3df8bb72de987cec146f3db3c5d003d8dbe8eb0833dba51136a6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5626.0.0-darwin-arm64.tar.gz"
      sha256 "a7a95529b0050cf0bdb72da2db5250e696a6b7d3c76ef84a85a6217602a8c211"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5626.0.0-linux-x64.tar.gz"
    sha256 "c70f7c98342bb229f7ca4ea46bafbcdc95f6a88ac2e5292cf96d16d91341bfb5"
  end
  version "5626.0.0"
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
