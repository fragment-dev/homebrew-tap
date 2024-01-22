require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.22-darwin-x64.tar.gz"
    sha256 "b5a29690a1deabcc57f44e090e5f80a8337ac18f4253ab93298e72ade9c990c7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.22-darwin-arm64.tar.gz"
      sha256 "1e98a87c2cb4c9c65597dc6a09ebe899126a8aef53fbd85206fa4ea0810dc016"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.22-linux-x64.tar.gz"
    sha256 "055bc03ab379dfcefc0621724b4ae79254a9a78083c166dcf321cdf4efccc87c"
  end
  version "2024.1.22"
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
