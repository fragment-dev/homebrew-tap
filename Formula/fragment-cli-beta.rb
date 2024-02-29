require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4666.0.0-darwin-x64.tar.gz"
    sha256 "e2619f7198245d30fe9ef90715b22cf183ceb6acad85f8e25f4ef82465a30c33"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4666.0.0-darwin-arm64.tar.gz"
      sha256 "23a71d51313f367f9dbf18be9bbad8773f2a76beb691aba7e7dc203836ec1981"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4666.0.0-linux-x64.tar.gz"
    sha256 "5bcc22d2f7be16172d9b72f30c820a5d73780f47a93691353e266a6c1c400c88"
  end
  version "4666.0.0"
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
