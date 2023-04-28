require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2540.0.0-darwin-x64.tar.gz"
    sha256 "cdc959724507eaccc5f10d431a440bd2350c77e54075adb8566ad045d36d1316"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2540.0.0-darwin-arm64.tar.gz"
      sha256 "ee4d3df97eef280d5c0bff54c1e53352422cfc8f9b570a07c1e25e76fb635c54"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2540.0.0-linux-x64.tar.gz"
    sha256 "38ec5e8b254f67e609e853c01c4c22a4b1dad49bfa56259ad193526ea1af360b"
  end
  version "2540.0.0"
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
