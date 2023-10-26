require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.25-1-darwin-x64.tar.gz"
    sha256 "dd13a864f98fe8407f4b207ba96979ad03760f1fd734766129bdba494818f165"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.25-1-darwin-arm64.tar.gz"
      sha256 "296d019b73fecffdf08ec807308e400a8f6226b63374c593594b975f6aabe61c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.25-1-linux-x64.tar.gz"
    sha256 "7aec4153d59917e5e5e62821b43709954ce00c8e6ed2fc9e2b8630894eeb00b9"
  end
  version "2023.10.25-1"
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
