require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2464.0.0-darwin-x64.tar.gz"
    sha256 "64c3bc82187b86ba7802cce7c8f0735ab83f466603119890cb46d8d3c5836873"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2464.0.0-darwin-arm64.tar.gz"
      sha256 "0b91c0552f80a8f18cd7de29f12039dd3848e47e243f16824c2568ba2df96534"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2464.0.0-linux-x64.tar.gz"
    sha256 "60b74ebc36873834bde4e224168f6678b47d856e44ae370802f926f5397c9b51"
  end
  version "2464.0.0"
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
