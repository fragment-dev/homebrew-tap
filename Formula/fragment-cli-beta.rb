require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3286.0.0-darwin-x64.tar.gz"
    sha256 "5f0de60033c4f15f00f8ac00311b0673991384c87510118535d94928370f3722"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3286.0.0-darwin-arm64.tar.gz"
      sha256 "d644f7dd5361f8beb9489c996a332fd130e1d53b76f9bb1166eac51ca5d1da54"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3286.0.0-linux-x64.tar.gz"
    sha256 "7abbdf7ff8d1dec31b0cf096a5ecde959842c49915e8937985b50946ce003ee4"
  end
  version "3286.0.0"
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
