require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5700.0.0-darwin-x64.tar.gz"
    sha256 "3db596ff99dd8edb1b1ff2f0777dfb663b779b95e52ab35304a446cc38f9eb60"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5700.0.0-darwin-arm64.tar.gz"
      sha256 "21cb5cbbf766d196ffb40309e1ff38d9a470d2160dd8f2f61755941f55a6b5a6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5700.0.0-linux-x64.tar.gz"
    sha256 "9b58f77e4e17bea346e00eb8f62a6b5c9b4bc7acd4afc0b60311a7fa63cbcdc5"
  end
  version "5700.0.0"
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
