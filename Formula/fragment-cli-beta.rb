require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5247.0.0-darwin-x64.tar.gz"
    sha256 "6a2ca504b99e23a8138879fbc73c8f860e213c056dfc420e1fb03f9ace4c5eaa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5247.0.0-darwin-arm64.tar.gz"
      sha256 "b62cfe092faa3dcb7e44971e9723d98d0620d41b6efe2836457a60cb0a89795a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5247.0.0-linux-x64.tar.gz"
    sha256 "a9a6afea33e4e9372e14130e5fb3493f59dc047032b2bdb076639b1121355f8e"
  end
  version "5247.0.0"
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
