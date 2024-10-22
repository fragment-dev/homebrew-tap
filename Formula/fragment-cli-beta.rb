require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5686.0.0-darwin-x64.tar.gz"
    sha256 "05c39e91eaeaee7d93ac2b9587f649642ce6332d4162f2f555ea5de737148c21"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5686.0.0-darwin-arm64.tar.gz"
      sha256 "a8ce67934b077fd5507f1a79a5dd8a00148ef5417f15371d0d3012fd88be251f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5686.0.0-linux-x64.tar.gz"
    sha256 "85b77ef8c2a304e131cdaea00ae103f802396a5581eeb58bb8a6d0e59703481b"
  end
  version "5686.0.0"
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
