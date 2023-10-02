require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3734.0.0-darwin-x64.tar.gz"
    sha256 "8ad6cc03f0fa6d9f549e11e2e41d06277efeab07653d0f3992467e01f66f748b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3734.0.0-darwin-arm64.tar.gz"
      sha256 "0d14fe6cff99ffdbc2282e7a82c77980092cc11ecee0f6587e02c1d535e80c17"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3734.0.0-linux-x64.tar.gz"
    sha256 "9b54f5f1f9b012853328109aabe927943f22efe6d2cd82f18044be32ed57393b"
  end
  version "3734.0.0"
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
