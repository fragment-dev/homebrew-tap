require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3646.0.0-darwin-x64.tar.gz"
    sha256 "b88c503027972581fbb6dffeaae2e5b4b63aef26668c2fd1f66d43b534ee7d8a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3646.0.0-darwin-arm64.tar.gz"
      sha256 "0c3bd757a36fceb5f17c73d73bcb56ab4e5d13e77ec145aba1fc2bd81e966f64"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3646.0.0-linux-x64.tar.gz"
    sha256 "0a7d46715f6f69acddc6b72c3d2e96fe0f7d1d3503ece001f633ea966dfd91ef"
  end
  version "3646.0.0"
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
