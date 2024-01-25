require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4428.0.0-darwin-x64.tar.gz"
    sha256 "694f517355dafa56e622fac8cbec2a93f0d3e8a95496e4ea5ed8d425f324b92f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4428.0.0-darwin-arm64.tar.gz"
      sha256 "32cfe7f9cece9119b746994194fc27ec8b585fd0656e34d5e21ddb03de7316f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4428.0.0-linux-x64.tar.gz"
    sha256 "dbfb98741f46ce8f5abdb2153250ae1537345e0b385e59ee4d42c7debebe124c"
  end
  version "4428.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
