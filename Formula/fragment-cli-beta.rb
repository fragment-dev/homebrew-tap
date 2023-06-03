require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2791.0.0-darwin-x64.tar.gz"
    sha256 "68ea21cce4d0c97467e5f54b4140dc0fe836c734f0d04faea4e25680eb290bad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2791.0.0-darwin-arm64.tar.gz"
      sha256 "8593af9cd925bed78202a3d40b17208c0f1810a617e165058956324dcfe7216a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2791.0.0-linux-x64.tar.gz"
    sha256 "6827c30a9e722f39dd13ee42528b33047f74eafabcc6ee3ea77b26926ab5b33a"
  end
  version "2791.0.0"
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
