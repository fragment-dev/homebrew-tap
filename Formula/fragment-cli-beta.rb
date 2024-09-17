require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5601.0.0-darwin-x64.tar.gz"
    sha256 "9ecab1d4b21c3776bafdd35097b79f45f2a7079efa87fbe53a45627cf5d2b37f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5601.0.0-darwin-arm64.tar.gz"
      sha256 "31bb9ccac0a398bfe77f2b687aeebfb8f6cbcfa8ed9d9b7ecda10df1887bb67e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5601.0.0-linux-x64.tar.gz"
    sha256 "48b457e26f4c52497d42cb70eee376cc4962c058ca6cad36ef8da0f10b5ff7aa"
  end
  version "5601.0.0"
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
