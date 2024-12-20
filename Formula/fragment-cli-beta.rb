require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5951.0.0-darwin-x64.tar.gz"
    sha256 "cf3edd9bc4fcb1ad7b2d4a3244d7b0c8e46d9390a76a5f99f88db8e137e5a2e0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5951.0.0-darwin-arm64.tar.gz"
      sha256 "0c63ab4ffb0dfe29c712e09ee9b0e8c02210a4b88bd5f8d892fd73ffc094888a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5951.0.0-linux-x64.tar.gz"
    sha256 "cbc49141e62a827414feefd3b99c9f680bf850ff9033254d4f4a9fb3da579c05"
  end
  version "5951.0.0"
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
