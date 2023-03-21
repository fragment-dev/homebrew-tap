require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2252.0.0-darwin-x64.tar.gz"
    sha256 "58702bbebf0e376e89682c05ae02c96e43a945d66e9047d9c558ac26a3a806ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2252.0.0-darwin-arm64.tar.gz"
      sha256 "edc6317b71ef2a740c67a7db527949f5ee0183f5c37588416562ef91dfa59b85"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2252.0.0-linux-x64.tar.gz"
    sha256 "698a26fdd9893d8180675cab0cc9ae26a74a55afb0f956d83d6ce6b3c3833844"
  end
  version "2252.0.0"
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
