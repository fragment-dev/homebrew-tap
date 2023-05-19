require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2702.0.0-darwin-x64.tar.gz"
    sha256 "fd2f148a01f3495f852df8f801147d9d7ce9fece0ccc0b914e228745942f40e9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2702.0.0-darwin-arm64.tar.gz"
      sha256 "d2037940891142832d531a92d39ad2ea4190ba3aa24af44963dedf4bde19d2eb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2702.0.0-linux-x64.tar.gz"
    sha256 "685bc48731d63de455d50d8d5bedc89b307879cad089a9d1f1bab264cd13f5a4"
  end
  version "2702.0.0"
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
