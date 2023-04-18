require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2467.0.0-darwin-x64.tar.gz"
    sha256 "f014fb031dadcab73a40abd076249a5a7b989371c9efa7ad07684a6ceb86914c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2467.0.0-darwin-arm64.tar.gz"
      sha256 "fcf66399e584dec4a29a96e3aca87ad831cc9b34256fb72e17cdb014a6607a7b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2467.0.0-linux-x64.tar.gz"
    sha256 "9f194092cc6cdcd39626014b3eb7049ccc78fbd8e89e362e2bbb31b01db591d6"
  end
  version "2467.0.0"
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
