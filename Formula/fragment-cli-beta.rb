require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5213.0.0-darwin-x64.tar.gz"
    sha256 "358bf060b0a9bbddeb095ddf38c919e32b2852598925e769b77b5c5d15109f8c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5213.0.0-darwin-arm64.tar.gz"
      sha256 "17ac759f3293b2aab88abc5b134fff8d655ee210a9a698bf5e04b19dc4ea504a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5213.0.0-linux-x64.tar.gz"
    sha256 "6fafb1830246e91d2dc70cd1f639a6b7a5081e5057648ce1d2d1723f0f9f05e9"
  end
  version "5213.0.0"
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
