require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5687.0.0-darwin-x64.tar.gz"
    sha256 "4c55a29fa82dbcf931a93c6231b51135ebe99938291a4ea4e0774f7c0c22e973"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5687.0.0-darwin-arm64.tar.gz"
      sha256 "a3dec1a1ebb2abdc8ec3bd8b2e63d17f3e9e2a6631df9e9a1b77f47c865e8fc9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5687.0.0-linux-x64.tar.gz"
    sha256 "e2968f34ea03d975574b14e21e93fac49b03d8de0508a87e5b55ce329409693f"
  end
  version "5687.0.0"
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
