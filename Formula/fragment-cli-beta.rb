require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5379.0.0-darwin-x64.tar.gz"
    sha256 "daa2a5757edb5a1122ed33340dd1d93948794ebf706e8cd099c934da87160cb8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5379.0.0-darwin-arm64.tar.gz"
      sha256 "a05f09b6c92705f1944cdf40beb660822874804f0459b5aae21feaa02c319421"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5379.0.0-linux-x64.tar.gz"
    sha256 "416e3bc9941b3a1ba9c6ca4acd13e9a7a22e7ea3029224b57eec7ee15bafd282"
  end
  version "5379.0.0"
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
