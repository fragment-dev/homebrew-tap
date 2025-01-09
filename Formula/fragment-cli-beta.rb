require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6057.0.0-darwin-x64.tar.gz"
    sha256 "4abe8d83543a5768990bc62a3fd0876ea904b1b9c87cdbefd258692855dc4fc8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6057.0.0-darwin-arm64.tar.gz"
      sha256 "c5288e041531489e931cd6a7c6f2bc64cce327b923f155b7f0da6d3c6f5b0802"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6057.0.0-linux-x64.tar.gz"
    sha256 "8454f780d4bd021fbff7ffba2ef307b1fbbdd5205c2d0f5f9769277b6d0a4de6"
  end
  version "6057.0.0"
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
