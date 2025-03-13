require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6342.0.0-darwin-x64.tar.gz"
    sha256 "7f88e09efb5934308abff929327a1740b6bef2ad57ff13803b784f0de402d7ed"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6342.0.0-darwin-arm64.tar.gz"
      sha256 "c444dd2bfcc8b9a4bf7090ec6eb9ea723bdfd24d0d58784ec377a6145e005a0a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6342.0.0-linux-x64.tar.gz"
    sha256 "fa7936a09d188a2c5c7b1a7dc33b1cd4a4502b1241b8c3354564389ebf18d28f"
  end
  version "6342.0.0"
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
