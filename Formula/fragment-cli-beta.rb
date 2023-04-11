require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2402.0.0-darwin-x64.tar.gz"
    sha256 "13d3d0cdf2e8706e214d07b49e22a58523838172eebcad00fc3382e859962cb4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2402.0.0-darwin-arm64.tar.gz"
      sha256 "c6d56675dd59b2643e26e04ecdaa36b8bbe31a951e811105974a496215842409"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2402.0.0-linux-x64.tar.gz"
    sha256 "ea8fbcb7d09996f98e4e3418d8832c654707620b9679b54695bbe3d3c7ae49eb"
  end
  version "2402.0.0"
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
