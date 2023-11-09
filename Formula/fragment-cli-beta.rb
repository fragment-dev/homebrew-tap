require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3990.0.0-darwin-x64.tar.gz"
    sha256 "299dfdc751aea8fadf0aa21140394141b1e92d8c39d85332a78dc25c7b495d0e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3990.0.0-darwin-arm64.tar.gz"
      sha256 "0b71a477c405b40bceb9a3f8fefd6e2e4ceed1f05f3b48e948fbbb3167822063"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3990.0.0-linux-x64.tar.gz"
    sha256 "bf7d90557a0784180df4f4485bb5a83e66179b473126af7030867ac9b65af567"
  end
  version "3990.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
