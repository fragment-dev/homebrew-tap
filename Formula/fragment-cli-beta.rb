require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5707.0.0-darwin-x64.tar.gz"
    sha256 "f403dc84b1aeb8061592d53e575272bdccce356d5886fdc5093cb97dc65b2791"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5707.0.0-darwin-arm64.tar.gz"
      sha256 "8ef3154f1cc200943c312474a402a0e2a19e58858c8bc354ad5df7f68678c42b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5707.0.0-linux-x64.tar.gz"
    sha256 "c7c6112c9520ca1c92920797f6e1e0717e8c0dbbeacbc69d088fc449415b9c6a"
  end
  version "5707.0.0"
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
