require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2676.0.0-darwin-x64.tar.gz"
    sha256 "8790d2457e9304dd1f7f91158706ab102a371b30fabfef2f20406aa1bfc212a1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2676.0.0-darwin-arm64.tar.gz"
      sha256 "358e6d484368953afa42bf291bd758ecf83a2613de47c7c17dc432bbd714e6ca"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2676.0.0-linux-x64.tar.gz"
    sha256 "bba5f65b460a46b3c5f7928d62592e9251deadb7440ef6d031ba4bf0b346dfe2"
  end
  version "2676.0.0"
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
