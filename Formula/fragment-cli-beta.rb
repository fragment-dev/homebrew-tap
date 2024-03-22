require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4800.0.0-darwin-x64.tar.gz"
    sha256 "e97cf2760a74bc2e656b7d78451b39fa9b2915854f00cbe1cff9698e79258c60"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4800.0.0-darwin-arm64.tar.gz"
      sha256 "e2e468ac98a0f2eba4c8d62340b5f60eca12b9ec1d5ec76cb8ad42bb4b657459"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4800.0.0-linux-x64.tar.gz"
    sha256 "d9108edf318f30e47f5328352976dcd8ade3b8cd0ff8f1674d3cca678a894fec"
  end
  version "4800.0.0"
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
