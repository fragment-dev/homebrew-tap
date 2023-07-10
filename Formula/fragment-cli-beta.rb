require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3025.0.0-darwin-x64.tar.gz"
    sha256 "65003969d5f43a05c42fa90d0a4a735713ab3d5440e4ff376803419b85ee9f74"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3025.0.0-darwin-arm64.tar.gz"
      sha256 "25a20af95ca73c441ed71860206c1460823120764050138ab6c297c41cd3f747"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3025.0.0-linux-x64.tar.gz"
    sha256 "b861ed83fe8b5d470461133f67f9e286f0beb74627a7751216cf9ae71344c6c2"
  end
  version "3025.0.0"
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
