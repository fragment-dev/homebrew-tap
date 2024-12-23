require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5962.0.0-darwin-x64.tar.gz"
    sha256 "7d043054ff3cb69d73d1fc39c478f926ccb00443881bff6f2029f13e75eb0521"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5962.0.0-darwin-arm64.tar.gz"
      sha256 "b471f82b314b3f893cd363995d9428700998784bef052ecf81c6baa115210a45"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5962.0.0-linux-x64.tar.gz"
    sha256 "3c44dc1b0124c988c2ef379321c77ec0386a1a10b25484091a1a2eca4103946b"
  end
  version "5962.0.0"
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
