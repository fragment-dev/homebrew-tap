require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5144.0.0-darwin-x64.tar.gz"
    sha256 "b534261f61338c8d8da2ce6eb323db5374b32dd64b3b2673358acbebf3f60bef"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5144.0.0-darwin-arm64.tar.gz"
      sha256 "00f0caca9827575c2462824bb5827c99c36ab123b1a09d27e40fc3d9aae05da9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5144.0.0-linux-x64.tar.gz"
    sha256 "6c6c6cd369d499a13ef5d5466aa794be22495b12326277bf9fa7cbbb996eabd5"
  end
  version "5144.0.0"
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
