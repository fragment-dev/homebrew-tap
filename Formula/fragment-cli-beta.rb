require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2978.0.0-darwin-x64.tar.gz"
    sha256 "e92db47a775c53c7747e707ed002dc38ad9c0e605d56e58c26cd12d7f07505ce"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2978.0.0-darwin-arm64.tar.gz"
      sha256 "6516c3fc2792ca487e62effe6ee1706257f2a78246671aa1ba59584f4f6511d0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2978.0.0-linux-x64.tar.gz"
    sha256 "29a9fbeb933070c642c23dacb9b366fb7e3273ed697fbb904629dcd7afd8831c"
  end
  version "2978.0.0"
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
