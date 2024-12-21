require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5955.0.0-darwin-x64.tar.gz"
    sha256 "6d5af06aff2848162cb342a112094358d20c7d8f544a035c16cdf89b3bf6777e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5955.0.0-darwin-arm64.tar.gz"
      sha256 "c0e2d5a3b446c8b3ad233572abe57499a77b699dc9ee37b9f8d945f3ebc5581e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5955.0.0-linux-x64.tar.gz"
    sha256 "247bcbbd6eece364f4a8e77c0c7c9ebe317432accae766a1997376b7f6717afe"
  end
  version "5955.0.0"
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
