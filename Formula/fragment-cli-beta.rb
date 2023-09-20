require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3629.0.0-darwin-x64.tar.gz"
    sha256 "d8f834f8c9d94b853b39d3dd5f7c77a3010ce400fe16b3473a6b5428d09f4286"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3629.0.0-darwin-arm64.tar.gz"
      sha256 "9a363c27478c4b50d5e5f2234032704a60cfdf1ace6dfb9f7535e9ba8584c382"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3629.0.0-linux-x64.tar.gz"
    sha256 "9cf40c24696aed698c69aadd2ea85930d9c8d228a3af6a562798decf99b2dc12"
  end
  version "3629.0.0"
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
