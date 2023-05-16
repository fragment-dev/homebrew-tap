require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2673.0.0-darwin-x64.tar.gz"
    sha256 "95463de82ed46b7bfbf318e11a97fa7b7c0cca50162d31e7da775be3ba5a99b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2673.0.0-darwin-arm64.tar.gz"
      sha256 "42e14ee5ac60524be5c23abe92d9487d9093a0934a2a74ebda03fd9534a7973c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2673.0.0-linux-x64.tar.gz"
    sha256 "2f7866cdb94ec8a9b9f3f2bea33422ea68d7e2521e0362fb2928e70ec68c0aee"
  end
  version "2673.0.0"
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
