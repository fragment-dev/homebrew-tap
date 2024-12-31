require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6008.0.0-darwin-x64.tar.gz"
    sha256 "f2a9c8596305a9c9e26941dd42297105288d3a2424e038022268961fcdcb722f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6008.0.0-darwin-arm64.tar.gz"
      sha256 "eac72a2f7c0b07ee0bcc2145c6cef9778dfed690638b98e25fdd0eafbe790401"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6008.0.0-linux-x64.tar.gz"
    sha256 "67a870e0494c472dd9eff888aca7ffce584ead2c4c055b399bd9c3d265621e40"
  end
  version "6008.0.0"
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
