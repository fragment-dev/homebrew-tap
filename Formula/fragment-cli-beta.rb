require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5038.0.0-darwin-x64.tar.gz"
    sha256 "4e5b1b41e86c8a9ccaedf04023ae22e8a723179b8f617c1437ad8a3a984e2f5e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5038.0.0-darwin-arm64.tar.gz"
      sha256 "5e41e8ef623ec1e7b56f51dd8f3dbc16ba95b40405f2f4afd9cb61e22869bb8a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5038.0.0-linux-x64.tar.gz"
    sha256 "c269547a1fe8736c2836acddc3a23ab0d34234f966303efaca219257715ce0c4"
  end
  version "5038.0.0"
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
