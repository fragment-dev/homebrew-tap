require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5984.0.0-darwin-x64.tar.gz"
    sha256 "d3cdc1e87f0e0e465b25b9f08a4836c18587ee7dbe8490ecb6cdec144204ba2d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5984.0.0-darwin-arm64.tar.gz"
      sha256 "680ecec93c7fd7c7dc55b89acf5423f640c8009788d9f95c2f9b339474b3eed5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5984.0.0-linux-x64.tar.gz"
    sha256 "0c554267d28a6500f3502e03b178fe28687cc343b43d4d26c90321df55e70796"
  end
  version "5984.0.0"
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
