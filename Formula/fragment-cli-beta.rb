require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2339.0.0-darwin-x64.tar.gz"
    sha256 "22e6ac6c1de62e6573a17f3fbd74cc7e9e34f80301b7a9ada823c536870e9f14"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2339.0.0-darwin-arm64.tar.gz"
      sha256 "0358093ddabde36f79eb6dfde610a1975fcd125219df7b08fa7d6e136a48d4da"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2339.0.0-linux-x64.tar.gz"
    sha256 "d89a5cfdcb465649c2cb2ee701e020d82435fc9b4fd6fc65097274676cafd1d7"
  end
  version "2339.0.0"
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
