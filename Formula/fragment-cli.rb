require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.8-darwin-x64.tar.gz"
    sha256 "b0e67d1d8393f61f9d4b5fc8d7509e9cfdd892f261d5e66b16b601cf45b26939"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.8-darwin-arm64.tar.gz"
      sha256 "387b0e40fc584288a20aec1e1fe6872b41a01ca8f4823da248aad3540d94957f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.8-linux-x64.tar.gz"
    sha256 "b7ed6d24eb8026ca962626952638019e9d5437902a484658cf58a4a55443b672"
  end
  version "2025.1.8"
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
