require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.28-1-darwin-x64.tar.gz"
    sha256 "b41791cee1363fcfcfd48b4034c0b7153d1dcf35da7085f9d79100711ac9c887"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.28-1-darwin-arm64.tar.gz"
      sha256 "592c7ad6e6aea44b7d29fdebec93f32e07a3886a2fd2068a383e3535b82ecedd"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.28-1-linux-x64.tar.gz"
    sha256 "ddf950bd230e54d9e1f7fa6c4ccd10f6c70b424a5d88e0df33fd631255f95e09"
  end
  version "2025.1.28-1"
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
