require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3270.0.0-darwin-x64.tar.gz"
    sha256 "408060cbf3323e9921040c574cd60bad350dc1eba602da5c6062ad61669c3a5c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3270.0.0-darwin-arm64.tar.gz"
      sha256 "0b33aa75ec52c4a5d01baea30691ee852c5cc8f765e48fda800ec0d315254e92"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3270.0.0-linux-x64.tar.gz"
    sha256 "38c327f6d91b821a400e1f634ec0e4bbf58253310a132c18737648f9aaed0c57"
  end
  version "3270.0.0"
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
