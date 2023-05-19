require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2707.0.0-darwin-x64.tar.gz"
    sha256 "cf369be7457ea04ba549a5d3ea47635e3a662b85fd0f515fff274effac22409f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2707.0.0-darwin-arm64.tar.gz"
      sha256 "0845cdfe5797a1d3cf3834b4a339411e4689e0b7b6698b667de83e6c40b5e2e5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2707.0.0-linux-x64.tar.gz"
    sha256 "47285fab291d14a5866cf8eb7606b4f136e89e2c274e5d3ef2ea068a19618606"
  end
  version "2707.0.0"
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
