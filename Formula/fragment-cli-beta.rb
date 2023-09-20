require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3617.0.0-darwin-x64.tar.gz"
    sha256 "ee8bf2710a7af8d511c3ffcb51d44fef8c4fa0541af950f118c33e85f1c1e43c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3617.0.0-darwin-arm64.tar.gz"
      sha256 "5081ba9b10a1deea5a46610d11ed9307467ac93b444cfe2a58101be9c23634a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3617.0.0-linux-x64.tar.gz"
    sha256 "ef515282e5c17bce92734159ba504361b88e929fb9b3377cdb74666a0a834b99"
  end
  version "3617.0.0"
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
