require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2788.0.0-darwin-x64.tar.gz"
    sha256 "ee6c43c4b387f0210bcf3263a110bdb63acc97ff30785d2b6863c9d95991b842"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2788.0.0-darwin-arm64.tar.gz"
      sha256 "101cf678d01ab3cf1df592f52098d87b17d9c85b79830eca574c04c378736163"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2788.0.0-linux-x64.tar.gz"
    sha256 "ea7f2f141ca35f6ef69c5c97c299788bf9c1aed133f94147509f90a9fbb2bb4c"
  end
  version "2788.0.0"
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
