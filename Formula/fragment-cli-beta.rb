require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3785.0.0-darwin-x64.tar.gz"
    sha256 "76ee7ca20e6052e8a3f7712e28c4b7daed043ec945b03fb651245c2383fa0e72"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3785.0.0-darwin-arm64.tar.gz"
      sha256 "a62dc71ee5458b15245762c643a21e2879d12be17aba97ed127f50f0c6a0ac08"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3785.0.0-linux-x64.tar.gz"
    sha256 "38f0148d25f0a221bb624624375758cc7a6bf5a7fba1cfc60b5b8814a33dc7b5"
  end
  version "3785.0.0"
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
