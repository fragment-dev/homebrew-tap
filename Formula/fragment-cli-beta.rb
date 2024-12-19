require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5926.0.0-darwin-x64.tar.gz"
    sha256 "d53dcff1659bdb5bf517dd4f9f7727bb06706fc3faa7e6d90368f50bb0c65122"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5926.0.0-darwin-arm64.tar.gz"
      sha256 "6fb6b0a06b5bfecb851db15c2f8e00d2bc3842f5b41992d48a7f82a8922d65d0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5926.0.0-linux-x64.tar.gz"
    sha256 "1c1640260c9ebe2039743e3c7d01aec7039f297bd40dd404f2f8b718a45c38bc"
  end
  version "5926.0.0"
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
