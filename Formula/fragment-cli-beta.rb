require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2751.0.0-darwin-x64.tar.gz"
    sha256 "8f51048faa2530a7e8156261b350d6f85baae88ddbf354298e34a89c056699a0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2751.0.0-darwin-arm64.tar.gz"
      sha256 "34a5a34718303a852f8bdb4e65b835f95e4476ec61db340ccecf450368a94337"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2751.0.0-linux-x64.tar.gz"
    sha256 "54847d65350d27c2df4bc5909173485fa2fd3661872481298c62b07ec4892d4c"
  end
  version "2751.0.0"
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
