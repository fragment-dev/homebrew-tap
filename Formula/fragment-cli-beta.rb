require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5736.0.0-darwin-x64.tar.gz"
    sha256 "5d52bc5da865ab6a795b97b9b4558e4e3a3248147b596d5d9cb521f3770977ef"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5736.0.0-darwin-arm64.tar.gz"
      sha256 "aee76db0b55e707193685aaf07252070403c29b7689e09b67c05429c61190bfe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5736.0.0-linux-x64.tar.gz"
    sha256 "23066c4a31746504c1458e3a94b3df6d53441e12e93d2e0f67e03522c7d06576"
  end
  version "5736.0.0"
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
