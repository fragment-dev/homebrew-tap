require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3226.0.0-darwin-x64.tar.gz"
    sha256 "4eb9fbd2cdd9ded35de2ae9c4d02aceeb9f28327bac03d5cf78110ed70871443"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3226.0.0-darwin-arm64.tar.gz"
      sha256 "bbe9d575ce06ac39ad905ab51d495e082060840d8e7f26db0b865193f1342bd0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3226.0.0-linux-x64.tar.gz"
    sha256 "4ff8db15b8e8aeb7b96309e9f40a75540c97a308ec1e1cd52c2a9376909ea02b"
  end
  version "3226.0.0"
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
