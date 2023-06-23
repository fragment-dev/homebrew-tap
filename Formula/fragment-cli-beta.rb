require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2918.0.0-darwin-x64.tar.gz"
    sha256 "f86ef3f942e9384fd67ec09bc6c4b28685300ca2787b6eb365dfb18b38315d60"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2918.0.0-darwin-arm64.tar.gz"
      sha256 "0dfcd0c51d89e795962fcab59df371767b3d7d58086db17acca62b1ae24ce47f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2918.0.0-linux-x64.tar.gz"
    sha256 "53098c2cf0543facff33f0963c8ac43395b8dd0281d565fc24aca9f26b815ede"
  end
  version "2918.0.0"
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
