require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4631.0.0-darwin-x64.tar.gz"
    sha256 "f08c411c9702f79a543960de45ce2b913c5f41d248f8fcbcb15d37a4eaef8a16"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4631.0.0-darwin-arm64.tar.gz"
      sha256 "817fdbf2a47a9fd26f91e0f712b9c6ca2023a61caccf12fc0b0e578a3bda7a3c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4631.0.0-linux-x64.tar.gz"
    sha256 "525bec1b799f907fc1f2743043acc24c7c6feecce10fca0796c45d6497b607a0"
  end
  version "4631.0.0"
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
