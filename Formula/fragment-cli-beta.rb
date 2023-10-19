require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3870.0.0-darwin-x64.tar.gz"
    sha256 "f6afbd5bce40f34728b30204be99890c5a1ecab852d27e22663f607245788268"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3870.0.0-darwin-arm64.tar.gz"
      sha256 "516b3900960dfd37cc46d0343d147eff79955628e02764db28671ab5645576c7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3870.0.0-linux-x64.tar.gz"
    sha256 "41320062d34c840a335e2ec4c42206a98cc3c0c2409dd8547a02b08bfbbcb101"
  end
  version "3870.0.0"
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
