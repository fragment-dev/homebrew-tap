require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2775.0.0-darwin-x64.tar.gz"
    sha256 "667dc72a1535fed9f151345308bf7395cf6752439e7f4698a96dc0cc5ae14855"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2775.0.0-darwin-arm64.tar.gz"
      sha256 "d7a7c63e33b395a3c10fc122e95cc78f07f849e90891c4b0775fb9f7f8bbf89f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2775.0.0-linux-x64.tar.gz"
    sha256 "41f1cf062a00dd7657c96483d62151c0057457aa5289d760ce4888769eb90252"
  end
  version "2775.0.0"
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
