require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5623.0.0-darwin-x64.tar.gz"
    sha256 "34450fcaf658cba26fea69cd71cf8a9141654676d05fe4a52da312afa33e3ab7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5623.0.0-darwin-arm64.tar.gz"
      sha256 "5c690f9e4a193258a93cde4ac516e673c05c7f969ca8f065b3b857aed6f41051"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5623.0.0-linux-x64.tar.gz"
    sha256 "4a4c1420ed358a8a8474d77ec36f7e937cc4be636952504d414531cd1cc9906c"
  end
  version "5623.0.0"
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
