require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4753.0.0-darwin-x64.tar.gz"
    sha256 "6fb6b87b710ba2139f6e48531d3e3aed310a65f5ac383d71ffd1afe4c265fa69"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4753.0.0-darwin-arm64.tar.gz"
      sha256 "977cf090244d08a46c5fd4243f287a92f4b01452b7a9a8e9ab3a1093f5343098"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4753.0.0-linux-x64.tar.gz"
    sha256 "c704966b8da20559ffb7e205bd2a24c99e6fa467673691ea3f9356db143382e7"
  end
  version "4753.0.0"
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
