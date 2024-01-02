require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4245.0.0-darwin-x64.tar.gz"
    sha256 "c7b1216c539947975746d75f9f575084cfc7c462ce2dccd00bb21aa4afaa2e5d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4245.0.0-darwin-arm64.tar.gz"
      sha256 "56a38c1e891254e25a125e26d762f00af1b78c8531124cbde64491391954e7b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4245.0.0-linux-x64.tar.gz"
    sha256 "e2042bd166e825fb72a8a1fffeec77d7ee843539483a4a5e89daed5ebda97773"
  end
  version "4245.0.0"
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
