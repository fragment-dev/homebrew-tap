require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2376.0.0-darwin-x64.tar.gz"
    sha256 "d3429005a2aa2da5cfc48b1e8c74034c6e8137418fbdd0d35300d0fde8677f42"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2376.0.0-darwin-arm64.tar.gz"
      sha256 "4ccab328e87357272ed9186fa4132e41d1e77f71522ca7bf2aef3b02d8171187"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2376.0.0-linux-x64.tar.gz"
    sha256 "53f8152c1093a520120772985c7119efc884bfd678d17c80b5d5a13199b7ed4f"
  end
  version "2376.0.0"
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
