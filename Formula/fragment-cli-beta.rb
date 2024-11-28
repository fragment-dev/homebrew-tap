require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5838.0.0-darwin-x64.tar.gz"
    sha256 "fb2e584728bca30c4a539ffc30bf6654c3e9de06f91a2f878fe62b17a5f1e3d7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5838.0.0-darwin-arm64.tar.gz"
      sha256 "a1baee2a865d95c3455320ec626d65e8a8577fc0777ebecd6d5ad909dce5d5ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5838.0.0-linux-x64.tar.gz"
    sha256 "be7d6ce519d6ceddd5d7704eaf460c4fbcd717a30a17303388e0c7f872f7db98"
  end
  version "5838.0.0"
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
