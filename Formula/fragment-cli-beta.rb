require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5997.0.0-darwin-x64.tar.gz"
    sha256 "22b809c39526492a66368cd0492e04d977974c7d6293782318f1112d461995b2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5997.0.0-darwin-arm64.tar.gz"
      sha256 "46097a63fa52601840a4fb687558e86ffcd757db550c65acc42cfcd69cedfb92"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5997.0.0-linux-x64.tar.gz"
    sha256 "dba55209a5809f5aea6ea75940480342113bb51a5f67098fd2d4bbf8dcf5c6df"
  end
  version "5997.0.0"
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
