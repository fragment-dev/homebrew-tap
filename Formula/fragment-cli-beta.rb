require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3095.0.0-darwin-x64.tar.gz"
    sha256 "9bda1dd33802905c9a5d768dcba45426a0a4cf007f7c0f25fb0a16246b6cf3d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3095.0.0-darwin-arm64.tar.gz"
      sha256 "d497e54bc5f33e22301663b9ff69cd4e9a84b5dc58a12f4cd3b468bef6d6ab8c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3095.0.0-linux-x64.tar.gz"
    sha256 "8881d17e068d434b60115af6b5d9bbaeeb2758ea0a5ed113ed83395673f822f2"
  end
  version "3095.0.0"
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
