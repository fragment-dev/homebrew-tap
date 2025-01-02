require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6024.0.0-darwin-x64.tar.gz"
    sha256 "94b8dca6400138d82b4c92a193389db0209b5f0db116b11e0672a30e2e400785"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6024.0.0-darwin-arm64.tar.gz"
      sha256 "0bedbd5accafc5e8924ff739e383403c8b8a3911f54bc3c7396c062de3561e64"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6024.0.0-linux-x64.tar.gz"
    sha256 "4fde92872bc339dc8d379bcb3ad60caafea3c633ce4061f9ca51c506240490e3"
  end
  version "6024.0.0"
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
