require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5484.0.0-darwin-x64.tar.gz"
    sha256 "c97bc86b4843ff64030cb1a8fae921042bcf524d99a26a89b76e675bcb47cff8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5484.0.0-darwin-arm64.tar.gz"
      sha256 "e4aad1ea606a23b81f8f1f7d001057cc12fed8340d79ffc6e756477412e7e592"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5484.0.0-linux-x64.tar.gz"
    sha256 "6115b3be7a46edc638ed46edf274710ea60e7dd498a26171d083ed59402500dd"
  end
  version "5484.0.0"
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
