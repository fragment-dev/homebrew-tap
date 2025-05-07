require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6588.0.0-darwin-x64.tar.gz"
    sha256 "4e83b03163bd817a28f64d6f0897b5078ec05f4da2239224b31a7845ee6848c1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6588.0.0-darwin-arm64.tar.gz"
      sha256 "c0b9ff513c32799af91f4636d8e520f0b320aa819062374b49877bb3644492f3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6588.0.0-linux-x64.tar.gz"
    sha256 "81601b88f153f5bc1062cf95365815aa71ebee8e65a75d881e8f9ea93a22b831"
  end
  version "6588.0.0"
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
