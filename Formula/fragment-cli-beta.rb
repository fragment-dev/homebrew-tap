require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5724.0.0-darwin-x64.tar.gz"
    sha256 "c1f2fb8b9f6dbcc0a4fc6f3cdb1151ac5677ae0f45b74e1e635d7e2f4ea88958"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5724.0.0-darwin-arm64.tar.gz"
      sha256 "ebb42136571c5731a204575fb0ce80db987eeb65681709a74b0d55cf042c6ffa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5724.0.0-linux-x64.tar.gz"
    sha256 "96e776f91428190cd4ef5989748392b2a0807e92f2ee549ec793b2fd2882b504"
  end
  version "5724.0.0"
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
