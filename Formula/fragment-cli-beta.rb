require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6042.0.0-darwin-x64.tar.gz"
    sha256 "2e2593a7b717ae9bf45ae7bdfaaf838009625957d7ff954319ba0f691e41ef62"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6042.0.0-darwin-arm64.tar.gz"
      sha256 "396383bde0ff2422d930771579b401428cf875a8796453e11c8e69297123ef8e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6042.0.0-linux-x64.tar.gz"
    sha256 "f7b74ef37f1027e7d892a845aa5333ffdc33219ba2fe566700477cd2e7c35ce4"
  end
  version "6042.0.0"
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
