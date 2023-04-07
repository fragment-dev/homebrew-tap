require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2375.0.0-darwin-x64.tar.gz"
    sha256 "fc8caa0a695f97853f5ba91bc8b5b2844546076ad3f396c09169d1f1c90529dc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2375.0.0-darwin-arm64.tar.gz"
      sha256 "373ba03dc8ce3d175caadb8aad968da6354d0ca67eb826be9eda872c382d2fe2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2375.0.0-linux-x64.tar.gz"
    sha256 "842d0622d783d98ee1de3b7489f9c9befd34f1f9b2536a966ef8dc73136a78b6"
  end
  version "2375.0.0"
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
