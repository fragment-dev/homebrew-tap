require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5043.0.0-darwin-x64.tar.gz"
    sha256 "a2162038b6b82a8e3d1463015f96822ef75d4c5f9d3fead89a34fb013d968c93"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5043.0.0-darwin-arm64.tar.gz"
      sha256 "52065109349b071753b15ce140a10137cd90f73ebebcee284cd4eaa5a0476c63"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5043.0.0-linux-x64.tar.gz"
    sha256 "fd8820d5296198e73c9528d54db335e8c90254d257054ac27978fb16000116ab"
  end
  version "5043.0.0"
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
