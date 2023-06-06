require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2802.0.0-darwin-x64.tar.gz"
    sha256 "4be51a13afead5aae7e5920c44b437e819ac74ea7524c3a106aa1ab465df320a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2802.0.0-darwin-arm64.tar.gz"
      sha256 "018d7a66f00f62fdec20c9911e726a2f767d0356bf3b17a5529fc43a3e8b30e8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2802.0.0-linux-x64.tar.gz"
    sha256 "90084b5d32bd90e88c1419da6c73b2dbebf02c8c94265d0d4fb622b9e0c65940"
  end
  version "2802.0.0"
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
