require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1983.0.0-darwin-x64.tar.gz"
    sha256 "e3e07b925a23c11b7a0a0d984bc06e85f312f9fbb904ff5ef72a76c98c3c0a7d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1983.0.0-darwin-arm64.tar.gz"
      sha256 "4f19c9e6f98376c90d78058a4aaaa31650e0b1e4a3f22b01be76ac0d1bc2f07e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1983.0.0-linux-x64.tar.gz"
    sha256 "6dfa4858bd13d3c5119b836dda55430672fc12caa8b741e9dfae51648a6c3bd8"
  end
  version "1983.0.0"
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
