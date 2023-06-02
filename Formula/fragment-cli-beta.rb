require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2783.0.0-darwin-x64.tar.gz"
    sha256 "a68cb31cacd1ca6ef0d3e6dd27fda4f8bbd1f5d8a7dbc61b832b41043d4d9ecb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2783.0.0-darwin-arm64.tar.gz"
      sha256 "4c0e49de216431cee38b35fd310fbca73a3fd1d8245e8788583080a264ae0fe8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2783.0.0-linux-x64.tar.gz"
    sha256 "9b222dcb4202dd6cee84785264a428fcec0f7b0815a45fe0d86598915b32e25c"
  end
  version "2783.0.0"
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
