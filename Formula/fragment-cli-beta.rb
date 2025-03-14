require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6357.0.0-darwin-x64.tar.gz"
    sha256 "91f2236258d81d6488bfd90eb4a194ef7c1223030a602dee2e07a423fc9c3701"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6357.0.0-darwin-arm64.tar.gz"
      sha256 "1c20732b7ea34fb665ef1e8a5c51ab056a4624dc539cb7423ce7afba8274ad21"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6357.0.0-linux-x64.tar.gz"
    sha256 "627cf042b79f07825296457855bee120f7f42f2a5d1d468996747dd46ee44475"
  end
  version "6357.0.0"
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
