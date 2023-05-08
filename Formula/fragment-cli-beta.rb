require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2604.0.0-darwin-x64.tar.gz"
    sha256 "2ead7f240396fda70fe9c98124ceaf39c299e0876680f2686ffe3f1c69ade1d8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2604.0.0-darwin-arm64.tar.gz"
      sha256 "993cb0cdd50adb6b60ff85865bb0d255117e509e15626907a51aaab171a7238f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2604.0.0-linux-x64.tar.gz"
    sha256 "cca63ab1adca77c93d670b515fbad3febe64c1395785ec6ca1b441e2b5ebb03c"
  end
  version "2604.0.0"
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
