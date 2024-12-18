require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.18-1-darwin-x64.tar.gz"
    sha256 "38aa14e1cc54113a8959a1d43d7a4f9188d53e94b13d3b3e84e51410cf9da857"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.18-1-darwin-arm64.tar.gz"
      sha256 "347b08c8255d4cb032722da35a96108fa14622f3ce1935d6b89623e98c8ddd8e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.18-1-linux-x64.tar.gz"
    sha256 "cd99b5086355c387ebd146f1d9b20aa02faec73846724080559050fffbf5eaa2"
  end
  version "2024.12.18-1"
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
