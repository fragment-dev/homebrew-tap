require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2575.0.0-darwin-x64.tar.gz"
    sha256 "e0de3f5f185c5bdaf886cfb9222b88ad53fc9d7d53f8ab20de2d317678be80b5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2575.0.0-darwin-arm64.tar.gz"
      sha256 "8e1378fa51489f231de363108c7bcd961905834d372d87f0b7c074d3b0d96cf5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2575.0.0-linux-x64.tar.gz"
    sha256 "d12cb3fc7590545d212ba7a82f89d2202110a43c9b8ab1579f72d6bdbc1069c2"
  end
  version "2575.0.0"
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
