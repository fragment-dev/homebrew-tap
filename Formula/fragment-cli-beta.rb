require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2566.0.0-darwin-x64.tar.gz"
    sha256 "9194d59809039a10012ccce49c9ec2ca2a3d8f7ffd6368e35a39f5352a705d21"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2566.0.0-darwin-arm64.tar.gz"
      sha256 "2d52e9b2ec37f88f01201ee85be1fdda6293f78be67baf68e5a2c36d0a5bf812"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2566.0.0-linux-x64.tar.gz"
    sha256 "a3a0e903484a927169f2fa91a9458c7baccdf50f3e555ac8cdd596590bc5f71d"
  end
  version "2566.0.0"
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
