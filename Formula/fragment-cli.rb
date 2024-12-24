require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-darwin-x64.tar.gz"
    sha256 "dba8b93f15676eac4f84c7469e4f5b06d5a305a7a7ff80d7a6900e6d25540212"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-darwin-arm64.tar.gz"
      sha256 "5ba4f1b5c5aafb96218df701bdbb22575289cfa5b6b0b32a0b57d9c6dacdf456"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.24-linux-x64.tar.gz"
    sha256 "b5fb1c914f308e8558eaaf51c6bf12b10a6d96d9646e5055f1bfc278a7c5b613"
  end
  version "2024.12.24"
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
