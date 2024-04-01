require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4827.0.0-darwin-x64.tar.gz"
    sha256 "136dea99f220fb66b269f4784da646a3e93414ebdcbe238c1cfefc70c80c3933"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4827.0.0-darwin-arm64.tar.gz"
      sha256 "3d8ef868158f078f52d46fa441430bd6b6c1f366d41fbc8e58a8598e66c2dbbb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4827.0.0-linux-x64.tar.gz"
    sha256 "52653e2344d201d9a467ad30c99c2bb0c3136f6d7b6561a70d739d4203288e08"
  end
  version "4827.0.0"
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
