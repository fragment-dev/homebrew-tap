require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3685.0.0-darwin-x64.tar.gz"
    sha256 "219f3b0e99b7f56b96ff294e19d62bd68a8474a0a0df39258f28c12d49be8a0c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3685.0.0-darwin-arm64.tar.gz"
      sha256 "46bbb1b65be36456ab3dee5ead478ae5d3341e7c4373574074605ba0c5ba92de"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3685.0.0-linux-x64.tar.gz"
    sha256 "47d46efe0a2e837dc9e12bac1778b08deb82861a6a1c266aee521039c4d09c6b"
  end
  version "3685.0.0"
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
