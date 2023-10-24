require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3889.0.0-darwin-x64.tar.gz"
    sha256 "1715379c99944ce446fc53c520d1a41ad1bda3a541f1ff779d0e274180c6d1f0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3889.0.0-darwin-arm64.tar.gz"
      sha256 "4bbe0b9f2a7b60dcc2970507d346affd973cb050da3059cd51635a1a2ec60d1b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3889.0.0-linux-x64.tar.gz"
    sha256 "6424dd0b743fee61c52c4d84ef4c00036c990b1544fec5f6fdb074dec461bef5"
  end
  version "3889.0.0"
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
