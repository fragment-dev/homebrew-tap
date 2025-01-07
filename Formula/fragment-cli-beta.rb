require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6043.0.0-darwin-x64.tar.gz"
    sha256 "502f012d8f4cbe1570933d2125f3a14a529f95d954ef034b19f579385856cc89"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6043.0.0-darwin-arm64.tar.gz"
      sha256 "c254a310210c2e13952e3ba9d121ee31d168c8c4f0657245c3b3c984e95be958"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6043.0.0-linux-x64.tar.gz"
    sha256 "b2676525966dd7981984454ffc9e413d480bf414df96777f6b3f24c75da8e8a2"
  end
  version "6043.0.0"
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
