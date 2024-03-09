require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4742.0.0-darwin-x64.tar.gz"
    sha256 "41d85c480245dbfebbb8cde4c22310d4290df3d33abcad8dba95f37afccf5315"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4742.0.0-darwin-arm64.tar.gz"
      sha256 "38389b8368818bc2f1726b2471a24bf02c180d02bac1227b7c2a8fb097c5d730"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4742.0.0-linux-x64.tar.gz"
    sha256 "d796bbbe4e5ad40c564102e3e1764f4c3edf41ee8914d030678fc635a6a5978d"
  end
  version "4742.0.0"
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
