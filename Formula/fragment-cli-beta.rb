require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5586.0.0-darwin-x64.tar.gz"
    sha256 "6d191dd9a5ca708dd7044e01499f55de8d3af163d8c1a4905c6899a571045454"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5586.0.0-darwin-arm64.tar.gz"
      sha256 "83412d6592d6cd65c22f6d5cad532d72ad0c37fb0ec677ed87006fc967a48862"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5586.0.0-linux-x64.tar.gz"
    sha256 "ceaf012cd1b75e55108fa0ccf9ea9d2068b32260b5526e608ef160ce4f60d2dc"
  end
  version "5586.0.0"
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
