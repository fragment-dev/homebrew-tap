require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.12-1-darwin-x64.tar.gz"
    sha256 "b394c4a7509c2654983f6fe2735414b168cff98ea4fb9aa5a86e4a50ba19b405"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.12-1-darwin-arm64.tar.gz"
      sha256 "819eb934f74079f2e5c570b3bde7e089d9a59238f81bdae0574122a5c42e7ea4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.12-1-linux-x64.tar.gz"
    sha256 "3dbb834ee163a0cbe2b16bd64095633b1f2daee0f0883c7cb5124c8822f60690"
  end
  version "2023.7.12-1"
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
