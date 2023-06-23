require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2915.0.0-darwin-x64.tar.gz"
    sha256 "1a008a3228bb2e3f5c5b23fa1f714caccca2201e7197a4d012baa60895b12794"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2915.0.0-darwin-arm64.tar.gz"
      sha256 "55c4ad904c04b44e7939775bcde8170dd73317326c5e0ae7448f2912341401c1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2915.0.0-linux-x64.tar.gz"
    sha256 "a93d8ec03c7f82ac25e960d73abb215a9b79514ecf566a11d85773a6a57d5dd4"
  end
  version "2915.0.0"
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
