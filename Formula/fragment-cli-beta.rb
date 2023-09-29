require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3709.0.0-darwin-x64.tar.gz"
    sha256 "f4359edffca5ce40a09408fb17c9ae92fc982dcc12a8d58ea0e0220d9d778abd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3709.0.0-darwin-arm64.tar.gz"
      sha256 "9759288f4eef5ff08da5daa56d3925d66f115491a6a99b1535624de8fdfd8152"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3709.0.0-linux-x64.tar.gz"
    sha256 "882fa800e1df81fc374bd7003c2c37e95d6a07a6a137c6627cc4c21d6502bebb"
  end
  version "3709.0.0"
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
