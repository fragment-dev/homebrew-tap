require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2293.0.0-darwin-x64.tar.gz"
    sha256 "6ab9bcd217cc92f804ee57bd661bd75f4cf167da9c73097b30e6844752fb29d4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2293.0.0-darwin-arm64.tar.gz"
      sha256 "d0d488f29e9a4ba62cd519f918afa87b4521a050a15b1368dce037219917f4dd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2293.0.0-linux-x64.tar.gz"
    sha256 "017ab6c45a3c30acb8831563e915de0c940b022d609e222ed8606c87927271ce"
  end
  version "2293.0.0"
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
