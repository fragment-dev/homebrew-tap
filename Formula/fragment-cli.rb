require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.4-1-darwin-x64.tar.gz"
    sha256 "907abcb1208a36275e08c7b6781cc350dd8aa29173f7a7b80d8cc57d174e42c8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.4-1-darwin-arm64.tar.gz"
      sha256 "2190c3c9938957ce8dc64d3ce0d10b21ea250457aebd108f26ffbbc276a3613e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.4-1-linux-x64.tar.gz"
    sha256 "5371ab2b764a7d6764520b77ed31d34369ba6dfb283b5ae8ced37ac51bb10955"
  end
  version "2024.1.4-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
