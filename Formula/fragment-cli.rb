require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.12-darwin-x64.tar.gz"
    sha256 "982c307431295eecd9f7e6e7e2fca1bd8e70a93e15dde984854a3533938c9991"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.12-darwin-arm64.tar.gz"
      sha256 "1d9ff2e00873d88106e103f6910904dbcbb5cf91f28cb41fcee49a2a765e8a1e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.12-linux-x64.tar.gz"
    sha256 "dc1461f6871e4969c35ad4a7b4b4e098e7269b34415565c653a3cdf3283535eb"
  end
  version "2024.12.12"
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
