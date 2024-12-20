require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5941.0.0-darwin-x64.tar.gz"
    sha256 "6e3ea4fd49037af796a1efe660b183a359b7bce4f858a30bbe80e2f3f9cce458"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5941.0.0-darwin-arm64.tar.gz"
      sha256 "b4e5e7d9a9009abd3e5a1769d32798d42a335bef99240ec2594501ea295a15fb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5941.0.0-linux-x64.tar.gz"
    sha256 "7e938a1a8e83ac2e71ef9b1af3d7dc737251f0a0a3c5d1f01f6e65c4e40f6eac"
  end
  version "5941.0.0"
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
